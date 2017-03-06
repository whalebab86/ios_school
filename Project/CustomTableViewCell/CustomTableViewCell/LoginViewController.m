//
//  LoginViewController.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 24..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "LoginViewController.h"
#import "DataCenter.h"

@interface LoginViewController ()
<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginIdLabel;
@property (weak, nonatomic) IBOutlet UITextField *loginPwLabel;

@property (nonatomic) DataCenter *center;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.center = [DataCenter sharedInstance];
    
    self.loginIdLabel.text = self.center.userId;
    
    
    UIScreenEdgePanGestureRecognizer *test = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(didTest:)];
    test.delegate = self;
    test.enabled = YES;
    [test setEdges:UIRectEdgeAll];
    
    [self.view addGestureRecognizer:test];
    
    /*
    UILongPressGestureRecognizer *temp = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(didTest:)];
    temp.numberOfTouchesRequired = 1;
    temp.delegate = self;
    [self.view addGestureRecognizer:temp];
    */
    
    /*
    UITapGestureRecognizer *test = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTest:)];
    test.delegate = self;
    test.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:test];
     */
}

- (void)didTest:(UIGestureRecognizer *)sender {
    
//    NSLog(@"%ld", sender.numberOfTouches);
    //NSLog(@"%ld", sender.numberOfTouchesRequired);
    
    //NSLog(@"test");
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press {
    
    NSLog(@"press");
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    NSLog(@"touch");
    
    CGPoint temp = [touch locationInView:touch.view];
    NSLog(@"%ld / %lf : %lf", touch.tapCount, temp.x, temp.y);
    
    return YES;
}

- (IBAction)didClickLoginButton:(id)sender {
    
    if([self.loginPwLabel.text isEqualToString:self.center.userPw]){
        
        [[DataCenter sharedInstance] settingUserId:self.loginIdLabel.text];
        
        UINavigationController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NavigationViewController"];
        [self presentViewController:vc animated:YES completion:nil];
        
    } else {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Login"
                                              message:@"Login Fail"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:nil];;
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
