//
//  PostMainViewController.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 15..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "PostMainViewController.h"
#import "PostCustomTableViewCell.h"
#import "PostDetailViewController.h"

#import "DataCenter.h"

@interface PostMainViewController ()
<UITableViewDataSource, UITableViewDelegate, ActivityIndicatorViewDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *postTableView;

@property (nonatomic) BOOL isLoding;
@property (nonatomic) NSString *pageNo;

@end

@implementation PostMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDelegate:self];
    self.postTableView.refreshControl = self.refresh;
    
    self.pageNo = @"1";
    
    [self postListWithPageNo:self.pageNo];
}

#pragma mark - Custom Method
-(void)indicatorFinishWithRefreshControl:(UIRefreshControl *)refreshControl {
    
    [DataCenter sharedInstance].postInfo = [@[] mutableCopy];
    [self postListWithPageNo:@"1"];
}

#pragma mark - TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[DataCenter sharedInstance].postInfo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PostCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"postCustomCell" forIndexPath:indexPath];
    
    PostInfo *postInfo = [[DataCenter sharedInstance].postInfo objectAtIndex:indexPath.row];
    
    [cell.postCellView.layer setCornerRadius:30];
    [cell.postCellView setClipsToBounds:YES];
    
    cell.pk                    = postInfo.pk;
    cell.postImageView.image   = [UIImage imageNamed:@"postImageView"];
    cell.postTitleLabel.text   = postInfo.title;
    cell.postContentLabel.text = postInfo.content;
    
    /* Image Download */
    if(![postInfo.img_cover isEqual:[NSNull null]]) {
        NSURL *url = [NSURL URLWithString:postInfo.img_cover];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if(error == nil && ![data isEqual:[NSNull null]]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.postImageView.image = [UIImage imageWithData:data];
                });
            }
        }];
        
        [task resume];
    }
    /* Image Download */
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"postDetailSegue" sender:indexPath];
}

#pragma mark - Scroll View Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if(!self.isLoding) {
        if(scrollView.contentOffset.y + 600 > self.postTableView.contentSize.height) {
            
            [self postListWithPageNo:self.pageNo];
        }
    }
}

#pragma mark - Segue Method
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"postDetailSegue"]) {
        PostDetailViewController *vc = [segue destinationViewController];
        
        PostInfo *postInfo = [[DataCenter sharedInstance].postInfo objectAtIndex:((NSIndexPath *)sender).row];
        vc.pk = postInfo.pk;
    }
}

#pragma mark - Custom Method
-(void)postListWithPageNo:(NSString *)pageNo {
    
    self.isLoding = YES;
    [self startIndicatorViewWithIsSubmit:NO];
    [[DataCenter sharedInstance] PostList:pageNo competionBlock:^(BOOL isSuccess, NSObject *result) {
        
        if(isSuccess) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.postTableView reloadData];
                
                [self stopIndicatorView];
                [self.refresh endRefreshing];
                
                NSString *next = [((NSDictionary *)result) objectForKey:@"next"];
                if(next != nil && ![next isEqual:[NSNull null]]) {
                    self.pageNo = [[next componentsSeparatedByString:@"="] objectAtIndex:1];
                } else {
                    self.pageNo =  [NSString stringWithFormat:@"%ld", [self.pageNo integerValue] + 1];
                }
                
                self.isLoding = NO;
            });
        } else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.postTableView reloadData];
                
                [self stopIndicatorView];
                [self.refresh endRefreshing];
                
                self.isLoding = NO;
            });
        }
    }];
}

@end
