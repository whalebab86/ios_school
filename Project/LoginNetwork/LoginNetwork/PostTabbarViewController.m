//
//  PostTabbarViewController.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 16..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "PostTabbarViewController.h"

#import "DataCenter.h"

@interface PostTabbarViewController ()

@end

@implementation PostTabbarViewController

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if([DataCenter sharedInstance].userToken == nil || [[DataCenter sharedInstance].userToken isEqualToString:@""]) {
        [self performSegueWithIdentifier:@"LoginSegue" sender:self];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
