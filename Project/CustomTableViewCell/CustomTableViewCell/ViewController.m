//
//  ViewController.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 17..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "ViewController.h"

#import "TripHeaderView.h"
#import "TripCustomTableViewCell.h"
#import "TripTableViewCell.h"

#import "TripDetailViewController.h"
#import "TripSettingViewController.h"

#import "ShowMapViewController.h"

#import "DataCenter.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIScrollViewDelegate, TripCustomTableViewCellDelegate>

@property (nonatomic, weak) UIButton        *settingButton;
@property (nonatomic, weak) UIBarButtonItem *settingButtonItem;
@property (nonatomic, weak) UIButton        *editButton;
@property (nonatomic, weak) UIBarButtonItem *editButtonItem;

@property (nonatomic, weak) UITableView     *tableView;

@property (nonatomic, weak) TripHeaderView  *tripHeaderView;

@property (nonatomic)       CGFloat          beforeScrollOffsetY;
@property (nonatomic)       CGFloat          afterScrollOffsetY;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didProfileInfoChanged:) name:@"profileInfoChange" object:nil];
    
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self.navigationItem setTitle:@"test"];
    
    /*  setLeftBarButtonItem : Setting Button */
    UIButton *settingButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [settingButton setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    [settingButton setTintColor:[UIColor blackColor]];
    [settingButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [settingButton addTarget:self action:@selector(didClickBarButton:) forControlEvents:UIControlEventTouchUpInside];
    [settingButton setAccessibilityIdentifier:@"settingButton"];
    self.settingButton = settingButton;
    
    UIBarButtonItem *settingButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
    [self.navigationItem setLeftBarButtonItem:settingButtonItem];
    self.settingButtonItem = settingButtonItem;


    /*  setRightBarButtonItem : Edit Button */
    UIButton *editButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [editButton setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
    [editButton setTintColor:[UIColor blackColor]];
    [editButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [editButton addTarget:self action:@selector(didClickBarButton:) forControlEvents:UIControlEventTouchUpInside];
    [editButton setAccessibilityIdentifier:@"editButton"];
    self.editButton = editButton;
    
    UIBarButtonItem *editButtonItem = [[UIBarButtonItem alloc] initWithCustomView:editButton];
    [self.navigationItem setRightBarButtonItem:editButtonItem];
    self.editButtonItem = editButtonItem;
    
    /*  TableView Setting */
    UITableView *tripTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [tripTableView setDelegate:self];
    [tripTableView setDataSource:self];
    [tripTableView setBounces:NO];
    [tripTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tripTableView setAllowsSelection:NO];
    [tripTableView setBackgroundColor:[UIColor colorWithRed:233/255.0 green:234/255.0 blue:236/255.0 alpha:1]];
    
    [self.view addSubview:tripTableView];
    self.tableView = tripTableView;
    
    [self setNeedsFocusUpdate];
    [self setNeedsStatusBarAppearanceUpdate];
    
    [[DataCenter sharedInstance] fetchItems];
    [self.tableView reloadData];
}

- (void)didProfileInfoChanged:(NSNotification *)notification {
    
    [self.tripHeaderView settingTripViewInfo];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self changeNavigationBar];
    
    [[DataCenter sharedInstance] fetchItems];
    [self.tableView reloadData];
}

- (void)changeNavigationBar {
    
    CGFloat offsetY = self.tableView.contentOffset.y;
    
    if(offsetY < 242) {
        [self.navigationController.navigationBar setTranslucent:YES];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
        self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
        
        [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
        [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                          NSForegroundColorAttributeName : [UIColor blackColor],
                                                                          }];
        [self.navigationItem setTitle:@""];
        [self.view setBackgroundColor:[UIColor clearColor]];
        
        [[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"] setBackgroundColor:[UIColor clearColor]];
        
    } else {

        [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:26/255.0 green:36/255.0 blue:48/255.0 alpha:1]];
        
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                          NSForegroundColorAttributeName : [UIColor whiteColor]
                                                                          }];
        
        [self.view setBackgroundColor:[UIColor colorWithRed:26/255.0 green:36/255.0 blue:48/255.0 alpha:1]];
        [self.navigationItem setTitle:@"Trip Diary"];
        
        [[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"] setBackgroundColor:[UIColor colorWithRed:26/255.0 green:36/255.0 blue:48/255.0 alpha:1]];
    }
    
    
//    [self setNeedsFocusUpdate];
//    [self setNeedsStatusBarAppearanceUpdate];
}


#pragma mark - Custom Method
/* NavigationBarItem Click Method  */
- (void)didClickBarButton:(UIBarButtonItem *) sender {
    
    if([sender.accessibilityIdentifier isEqualToString:@"editButton"]) {
        
        TripDetailViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"TripDetailViewController"];
        
        [self.navigationController pushViewController:detailController animated:YES];
    } else if([sender.accessibilityIdentifier isEqualToString:@"settingButton"]) {
        
        TripSettingViewController *tripSettingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TripSettingNavigationController"];
        
        [self presentViewController:tripSettingViewController animated:YES completion:^{
            [[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"] setBackgroundColor:[UIColor clearColor]];
        }];
    }
}


#pragma mark - Table View Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return [[DataCenter sharedInstance].resultArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TripCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if( cell == nil ) {
        cell = [[TripCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell setDelegate:self];
    }
    cell.indexPath = indexPath;
    
    
    NSDate *tripDate = [[[DataCenter sharedInstance].resultArray objectAtIndex:indexPath.row] valueForKey:@"trip_date"];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ko_kr"];
    [df setLocale:locale];
    [df setDateFormat:@"yyyy.MM.dd"];
    
    [self formattedDateCompareToNow:tripDate];
    
    NSString *resultDate = [df stringFromDate:tripDate];
    
    cell.locationInfoLabel.text    = [[[DataCenter sharedInstance].resultArray objectAtIndex:indexPath.row] valueForKey:@"trip_main_location"];
    //cell.locationImage.
    cell.locationInfoSubLabel.text = [[[DataCenter sharedInstance].resultArray objectAtIndex:indexPath.row] valueForKey:@"trip_sub_location"];
    cell.contentImageView.image    = [[[DataCenter sharedInstance].resultArray objectAtIndex:indexPath.row] valueForKey:@"trip_image"];
    
    cell.tripInfoDayLabel.text     = resultDate;
    cell.tripInfoDateLabel.text    = [[[DataCenter sharedInstance].resultArray objectAtIndex:indexPath.row] valueForKey:@"trip_content"];
    
    
    return cell;
}


/* 날짜 비교 함수 */
- (NSInteger)formattedDateCompareToNow:(NSDate *)date
{
    NSDateFormatter *mdf = [[NSDateFormatter alloc] init];
    [mdf setDateFormat:@"yyyy-MM-dd"];
    NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:date]];
    NSInteger dayDiff = (int)[midnight timeIntervalSinceNow] / (60*60*24);
    return dayDiff;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70 + 95 + ((self.view.frame.size.width - 20) - 10) + 100;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    TripHeaderView *tripHeaderView = [[TripHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 375 + 60)];
    self.tripHeaderView = tripHeaderView;
        
    return tripHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //return 375 + 135 + self.view.frame.size.width + 60;
    return (self.view.frame.size.width-20) + 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Scroll View Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    self.afterScrollOffsetY = scrollView.contentOffset.y;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        CGFloat changeOffsetY = 242;
        
        if(self.beforeScrollOffsetY >= changeOffsetY && self.afterScrollOffsetY < changeOffsetY) {
            [self changeNavigationBar];
        }
        
        if(self.beforeScrollOffsetY < changeOffsetY  && self.afterScrollOffsetY >= changeOffsetY) {
            [self changeNavigationBar];
        }
    }];
    
    self.beforeScrollOffsetY = scrollView.contentOffset.y;
}

#pragma mark - TripCustomTableViewCell Delegate
-(void)didClickButton:(NSIndexPath *)indexPath buttonIdentifier:(NSString *)buttonIdentifier{
    
    //TripCustomTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if([buttonIdentifier isEqualToString:@"headerAddButton"]) {
        
        /* header add button */
        //[cell testtripInfoDateLabel];
        TripDetailViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"TripDetailViewController"];
        [self.navigationController pushViewController:detailController animated:YES];
    } else if([buttonIdentifier isEqualToString:@"likeButton"]) {
        /* footer like button */
        
    } else if([buttonIdentifier isEqualToString:@"showMapButton"]) {
        /* footer show on map button */
        
        [[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"] setBackgroundColor:[UIColor whiteColor]];
        
        ShowMapViewController *showMap = [self.storyboard instantiateViewControllerWithIdentifier:@"ShowMapViewController"];
        showMap.indexPath = indexPath;
        
        UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:showMap];
        
        [self presentViewController:vc animated:YES completion:nil];
        
    } else if([buttonIdentifier isEqualToString:@"shareButton"]) {
        /* footer share button */
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Delete Trip Info" message:@"Delete Trip Info" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *tripIndex = [[[DataCenter sharedInstance].resultArray objectAtIndex:indexPath.row] valueForKey:@"trip_index"];
            
            [[DataCenter sharedInstance] deleteTripInfo:tripIndex];
            [[DataCenter sharedInstance] fetchItems];
            
            [UIView animateWithDuration:0.5 animations:^{
                [self.tableView reloadData];
            }];
            
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:deleteAction];
        [alert addAction:cancelAction];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if([buttonIdentifier isEqualToString:@"writeButton"]) {
        /* footer write button */
        
        TripDetailViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"TripDetailViewController"];
        detailController.indexPath = indexPath;
        
        [self.navigationController pushViewController:detailController animated:YES];
    }
}

@end
