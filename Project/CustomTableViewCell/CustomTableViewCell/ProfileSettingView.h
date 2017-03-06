//
//  ProfileSettingView.h
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 22..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileSettingView : UIView

@property (nonatomic, weak) UIButton     *profileImageButton;

@property (nonatomic, weak) UITextField  *profileFirstNameLabel;
@property (nonatomic, weak) UITextField  *profileLastNameLabel;
@property (nonatomic, weak) UITextField  *profileTripTitleLabel;

@property (nonatomic, weak) UIButton     *profileDescriptionButton;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)settingProfileImage:(UIImage *)image;
- (void)settingDescriptionImage:(UIImage *)image;

@end
