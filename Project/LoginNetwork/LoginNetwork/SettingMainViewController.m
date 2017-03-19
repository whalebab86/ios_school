//
//  SettingMainViewController.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 15..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "SettingMainViewController.h"

#import "DataCenter.h"

@interface SettingMainViewController ()

@end

@implementation SettingMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#pragma mark - Custom Method
- (IBAction)didClickSettingButton:(id)sender {
    
    [self startIndicatorViewWithIsSubmit:YES];
    [[DataCenter sharedInstance] memberLogout:^(BOOL isSuccess, NSObject *result) {
        
        [self stopIndicatorView];
        
        [self.tabBarController performSegueWithIdentifier:@"LoginSegue" sender:self];
        
        if(isSuccess) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tabBarController setSelectedIndex:0];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tabBarController performSegueWithIdentifier:@"LoginSegue" sender:self];
            });
        }
    }];
}

@end
