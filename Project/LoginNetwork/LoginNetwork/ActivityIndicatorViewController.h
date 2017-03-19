//
//  ActivityIndicatorViewController.h
//  ActivityIndicator
//
//  Created by CLAY on 2017. 3. 18..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ActivityIndicatorViewDelegate <NSObject>

-(void)indicatorFinishWithRefreshControl:(UIRefreshControl *)refreshControl;

@end

@interface ActivityIndicatorViewController : UIViewController

@property (nonatomic) id<ActivityIndicatorViewDelegate> delegate;

@property (nonatomic, weak) UIView *indicatorView;

@property (nonatomic) UIRefreshControl *refresh;
@property (nonatomic) UIRefreshControl *customRefresh;

-(void)startIndicatorViewWithIsSubmit:(BOOL)isSubmit;
-(void)stopIndicatorView;

-(void)startCustomIndicatorViewWithIsSubmit:(BOOL)isSubmit;
-(void)stopCustomIndicatorView;

@end
