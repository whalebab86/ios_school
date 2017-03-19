//
//  MemberLoginViewController.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 15..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "MemberLoginViewController.h"

#import "DataCenter.h"
#import "MemberInfo.h"

@interface MemberLoginViewController ()
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollView;

@property (weak, nonatomic) IBOutlet UITextField *userNmTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPwTextField;

@end

@implementation MemberLoginViewController

- (void)viewDidAppear:(BOOL)animated {
    
    /* Navigation Bar Hidden YES */
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.userNmTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username"
                                                                                 attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.userPwTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password"
                                                                                 attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillChange:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillChange:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - TextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if(self.userNmTextField == textField) {
        [self.userPwTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}


#pragma mark - Custom Method

- (IBAction)didClickMemberButton:(UIButton *)sender {
    
    [self startIndicatorViewWithIsSubmit:YES];
    
    if(sender.tag == 10) {
        MemberInfo *info = [[MemberInfo alloc] init];
        
        info.username = self.userNmTextField.text;
        info.password = self.userPwTextField.text;
        
        [self.userNmTextField resignFirstResponder];
        [self.userPwTextField resignFirstResponder];
        
        [[DataCenter sharedInstance] memberLogin:info completionBlock:^(BOOL isSuccess, NSObject* result) {
            
            [self stopIndicatorView];
            
            if(isSuccess) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self dismissViewControllerAnimated:YES completion:nil];
                });
                
            } else {
                
            }
        }];
    }
}

/* Keyboard Show/Hide Noticifation */
- (void)keyboardWillChange:(NSNotification *)notification {
    
    CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    CGPoint point = self.loginScrollView.frame.origin;
    
    [self.loginScrollView setScrollEnabled:YES];
    
    if([notification.name isEqualToString:@"UIKeyboardWillShowNotification"]) {
        
        CGPoint movePoint = CGPointMake(0, point.y + (keyboardRect.size.height - 55));
        [self.loginScrollView setContentOffset:movePoint animated:YES];
    } else if([notification.name isEqualToString:@"UIKeyboardWillHideNotification"]) {
        
        [self.loginScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    
    [self.loginScrollView setScrollEnabled:NO];
}

@end
