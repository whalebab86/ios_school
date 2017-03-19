//
//  ActivityIndicatorViewController.m
//  ActivityIndicator
//
//  Created by CLAY on 2017. 3. 18..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "ActivityIndicatorViewController.h"

@interface ActivityIndicatorViewController ()

@property (nonatomic, weak) UIActivityIndicatorView *indicator;
@property (nonatomic, weak) UIImageView *customIndicator;

@end

@implementation ActivityIndicatorViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    UIView *indicatorView = [[UIView alloc] init];
    [indicatorView setCenter:self.view.center];
    self.indicatorView = indicatorView;
    [self.view addSubview:indicatorView];
    
    
    /* Indicator Start */
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator setCenter:self.indicatorView.center];
    [indicator setHidesWhenStopped:YES];
    self.indicator = indicator;
    
    [indicatorView setBackgroundColor:[UIColor lightGrayColor]];
    [indicatorView setAlpha:0];
    [indicatorView addSubview:indicator];
    /* Indicator End */
    
    
    /* Custom Indicator Start */
    NSArray *customImage = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"post_indicator_status1.png"],
                            [UIImage imageNamed:@"post_indicator_status2.png"],
                            [UIImage imageNamed:@"post_indicator_status3.png"],
                            [UIImage imageNamed:@"post_indicator_status4.png"], nil];
    
    UIImageView *customIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [customIndicator setCenter:self.indicatorView.center];
    [customIndicator setAnimationImages:customImage];
    [customIndicator setAnimationDuration:0.6];
    [customIndicator setCenter:self.indicatorView.center];
    self.customIndicator = customIndicator;
    [indicatorView addSubview:customIndicator];
    /* Custom Indicator Start*/


    /* Refresh Control Start */
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(didRefreshTalbeView:) forControlEvents:UIControlEventValueChanged];
    [refresh setAttributedTitle:[[NSAttributedString alloc]initWithString:@"Pull To Refresh"]];
    
    self.refresh = refresh;
    /* Refresh Control End */
    
    
    /* Custom Refresh Control Start */
    UIRefreshControl *customRefresh = [[UIRefreshControl alloc] init];
    [customRefresh addTarget:self action:@selector(didRefreshTalbeView:) forControlEvents:UIControlEventValueChanged];
    
    // 기존 로딩이미지 icon 숨기기
    customRefresh.tintColor = [UIColor clearColor];
    
    UIView *mastView = [[UIView alloc] initWithFrame:customRefresh.bounds];
    [mastView setBackgroundColor:[UIColor lightGrayColor]];
    [customRefresh addSubview:mastView];
    
    self.customRefresh = customRefresh;
    /* Custom Refresh Control End */
}

/* 화면 전환 시 Indicator Stop */
-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self stopIndicatorView];
    [self stopCustomIndicatorView];
}

#pragma mark - Refresh Control
/* refresh Control Delegate */
-(void)didRefreshTalbeView:(UIRefreshControl *)sender {
        
    [self.delegate indicatorFinishWithRefreshControl:sender];
}

#pragma mark - Activity Indicator
/* Indicator View Show or Hide */
-(void)indicationViewWithIsHidden:(BOOL)isHidden isSubmit:(BOOL)isSubmit {
    
    if(isHidden) {
        [self.indicatorView setAlpha:0];
    } else {
        if(isSubmit) {
            
            [self.indicatorView   setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//            [self.indicatorView   setCenter:self.view.center];
            
            [self.indicator       setCenter:self.view.center];
            [self.customIndicator setCenter:self.view.center];
            
            [self.indicatorView setBackgroundColor:[UIColor lightGrayColor]];
            [self.indicatorView setAlpha:0.6];
        } else {
            
            [self.indicatorView   setFrame:self.indicator.bounds];
            [self.indicatorView   setCenter:self.view.center];
            
            [self.indicator       setFrame:self.indicatorView.bounds];
            [self.customIndicator setFrame:self.indicatorView.bounds];
            
            [self.indicatorView setBackgroundColor:[UIColor clearColor]];
            [self.indicatorView setAlpha:0.6];
        }
    }
}

/* Indicator Start */
-(void)startIndicatorViewWithIsSubmit:(BOOL)isSubmit  {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self indicationViewWithIsHidden:NO isSubmit:isSubmit];
        
        [self.indicator startAnimating];
    });
}

/* Indicator Stop */
-(void)stopIndicatorView {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self indicationViewWithIsHidden:YES isSubmit:NO];
        
        [self.indicator stopAnimating];
    });
}

/* Custom Indicator Start */
-(void)startCustomIndicatorViewWithIsSubmit:(BOOL)isSubmit {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self indicationViewWithIsHidden:NO isSubmit:isSubmit];
        
        [self.customIndicator startAnimating];
    });
}

/* Custom Indicator Stop */
-(void)stopCustomIndicatorView  {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self indicationViewWithIsHidden:YES isSubmit:NO];
        
        [self.customIndicator stopAnimating];
    });
}

@end
