//
//  MemberSigninViewController.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 15..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "MemberSigninViewController.h"

#import "DataCenter.h"

@interface MemberSigninViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollView;

@property (weak, nonatomic) IBOutlet UITextField *userNmTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPwTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPwCheckTextField;

@end

@implementation MemberSigninViewController

- (void)viewWillAppear:(BOOL)animated {
 
    /* Navigation Bar Hidden NO */
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    /* Navigation Bar Hidden YES */
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.userNmTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.userPwTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.userPwCheckTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillHideNotification object:nil];
    
//    [[DataCenter sharedInstance] memberSignup];
}

#pragma mark - TextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if(self.userNmTextField == textField) {
        [self.userPwTextField becomeFirstResponder];
        
    } else if(self.userPwTextField == textField) {
        [self.userPwCheckTextField becomeFirstResponder];
        
    } else {
        [textField resignFirstResponder];
        
    }
    
    return YES;
}



#pragma mark - Custom Method

/* Keyboard Show/Hide Noticifation */
- (void)keyboardWillChange:(NSNotification *)notification {
    
    CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    CGPoint point = self.loginScrollView.frame.origin;
    
    [self.loginScrollView setScrollEnabled:YES];
    
    if([notification.name isEqualToString:@"UIKeyboardWillShowNotification"]) {
        
        CGPoint movePoint = CGPointMake(0, point.y + (keyboardRect.size.height - 50));
        [self.loginScrollView setContentOffset:movePoint animated:YES];
    } else if([notification.name isEqualToString:@"UIKeyboardWillHideNotification"]) {
        
        [self.loginScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    
    [self.loginScrollView setScrollEnabled:NO];
}

- (IBAction)didClickSigninButton:(id)sender {
    
    MemberInfo *info = [[MemberInfo alloc] init];
    
    info.username      = self.userNmTextField.text;
    info.password      = self.userPwTextField.text;
    info.passwordCheck = self.userPwCheckTextField.text;
    
    [self.userNmTextField resignFirstResponder];
    [self.userPwTextField resignFirstResponder];
    [self.userPwCheckTextField resignFirstResponder];
    
    [self startIndicatorViewWithIsSubmit:YES];
    [[DataCenter sharedInstance] memberSignup:info completionBlock:^(BOOL isSuccess, NSObject* result) {
        
        [self stopIndicatorView];
        if(isSuccess) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:YES completion:nil];
            });
            
        } else {
            
            NSString *msg = @"";
            
            NSArray *username  = [(NSDictionary*)result objectForKey:@"username"];
            NSArray *password1 = [(NSDictionary*)result objectForKey:@"password1"];
            NSArray *password2 = [(NSDictionary*)result objectForKey:@"password2"];
            NSArray *error     = [(NSDictionary*)result objectForKey:@"non_field_errors"];
            
            if(username != nil) {
                msg = [@"username : " stringByAppendingString:[username objectAtIndex:0]];
            } else if(password1 != nil) {
                msg = [@"password1 : " stringByAppendingString:[password1 objectAtIndex:0]];
            } else if(password2 != nil) {
                msg = [@"password2 : " stringByAppendingString:[password2 objectAtIndex:0]];
            } else if(error != nil) {
                msg = [@"error : " stringByAppendingString:[error objectAtIndex:0]];
            }
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                           message:msg
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:nil];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

@end
