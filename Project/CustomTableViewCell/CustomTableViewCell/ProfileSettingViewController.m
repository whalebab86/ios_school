//
//  ProfileSettingViewController.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 22..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "ProfileSettingViewController.h"
#import "ProfileSettingView.h"

#import "DataCenter.h"

@interface ProfileSettingViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (nonatomic, weak) ProfileSettingView *profileSettingView;

@property (nonatomic) NSData *profileImage;
@property (nonatomic) NSData *descriptionImage;
@property (nonatomic) BOOL    isPicker;

@end

@implementation ProfileSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didClickButton:)];
    [doneButton setAccessibilityIdentifier:@"doneButton"];
    [self.navigationItem setRightBarButtonItem:doneButton];
    
    ProfileSettingView *profileSettingView = [[ProfileSettingView alloc] initWithFrame:self.view.frame];
    
    [profileSettingView.profileImageButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [profileSettingView.profileImageButton setAccessibilityIdentifier:@"profileImageButton"];
    
    [profileSettingView.profileDescriptionButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [profileSettingView.profileDescriptionButton setAccessibilityIdentifier:@"profileDescriptionButton"];
    
    self.profileImage     = [DataCenter sharedInstance].profileImage;
    self.descriptionImage = [DataCenter sharedInstance].desctiprionImage;
        
    [self.view addSubview:profileSettingView];
    self.profileSettingView = profileSettingView;
}

- (void)didClickButton:(UIButton *)sender {
    
    
    if([sender.accessibilityIdentifier isEqualToString:@"doneButton"]) {
        
        [[DataCenter sharedInstance] settingFirstName:self.profileSettingView.profileFirstNameLabel.text];
        [[DataCenter sharedInstance] settingLastName:self.profileSettingView.profileLastNameLabel.text];
        [[DataCenter sharedInstance] settingTripTitle:self.profileSettingView.profileTripTitleLabel.text];
        [[DataCenter sharedInstance] settingProfileImage:self.profileImage];
        [[DataCenter sharedInstance] settingDescriptionImage:self.descriptionImage];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"profileInfoChange" object:@"temp"];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        
        if([sender.accessibilityIdentifier isEqualToString:@"profileImageButton"])
            self.isPicker = NO;
        if([sender.accessibilityIdentifier isEqualToString:@"profileDescriptionButton"])
            self.isPicker = YES;
        
        UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if([sender.accessibilityIdentifier isEqualToString:@"profileDescriptionButton"])
            
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:picker animated:YES completion:NULL];
        }];
        
        UIAlertAction *chooseLibrary = [UIAlertAction actionWithTitle:@"Choose from library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            [self presentViewController:picker animated:YES completion:NULL];
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alertController addAction:takePhoto];
        [alertController addAction:chooseLibrary];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *resultImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    //[self.profileSettingView settingProfileImage:resultImage];
    if(self.isPicker) {
        [self.profileSettingView settingDescriptionImage:resultImage];
        self.descriptionImage = UIImagePNGRepresentation(resultImage);
        
    } else {
        [self.profileSettingView settingProfileImage:resultImage];
        self.profileImage = UIImagePNGRepresentation(resultImage);
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
