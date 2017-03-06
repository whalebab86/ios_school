//
//  ProfileSettingView.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 22..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "ProfileSettingView.h"
#import "DataCenter.h"

@interface ProfileSettingView ()

@property (nonatomic, weak) UIScrollView *profileScrollView;

@property (nonatomic, weak) UIView       *profileMainView;

@property (nonatomic, weak) UIView       *profileImageView;
@property (nonatomic, weak) UIImageView  *profileImage;
@property (nonatomic, weak) UILabel      *profileImageLabel;
@property (nonatomic, weak) UIView       *profileImageBorderView;

@property (nonatomic, weak) UIView       *profileFirstNameView;
@property (nonatomic, weak) UIView       *profileFirstNameBorderView;
@property (nonatomic, weak) UILabel      *profileFirstNameCaptionLabel;

@property (nonatomic, weak) UIView       *profileLastNameView;
@property (nonatomic, weak) UIView       *profileLastNameBorderView;
@property (nonatomic, weak) UILabel      *profileLastNameCaptionLabel;

@property (nonatomic, weak) UIView       *profileTripTitleView;
@property (nonatomic, weak) UIView       *profileTripTitleBorderView;
@property (nonatomic, weak) UILabel      *profileTripTitleCaptionLabel;

@property (nonatomic, weak) UIView       *profileDescriptionView;
@property (nonatomic, weak) UILabel      *profileDescriptionLabel;
@property (nonatomic, weak) UIImageView  *profileDescriptionImage;

@end

@implementation ProfileSettingView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        
        /* Draw View */
        [self setDrawProfileSettingView];
        
        /* Setting Frame */
        [self setFrameProfileSettingView];
    }
    
    return self;
}

-(void)layoutSubviews {
    
    /* Setting Frame */
    [self setFrameProfileSettingView];
}

- (void)setDrawProfileSettingView {
    
    
    UIScrollView *profileScrollViewTemp = [[UIScrollView alloc] init];
    [self addSubview:profileScrollViewTemp];
    self.profileScrollView = profileScrollViewTemp;
    
    
    /* ########## Profile Image ########## */
    
    UIView *profileMainViewTemp = [[UIView alloc] init];
    [profileScrollViewTemp addSubview:profileMainViewTemp];
    self.profileMainView = profileMainViewTemp;
    
    UIView *profileImageBorderViewTemp = [[UIView alloc] init];
    [profileImageBorderViewTemp setBackgroundColor:[UIColor lightGrayColor]];
    [profileScrollViewTemp addSubview:profileImageBorderViewTemp];
    self.profileImageBorderView = profileImageBorderViewTemp;
    
    UIImageView *profileImageTemp = [[UIImageView alloc] init];
    [profileImageTemp setClipsToBounds:YES];
    [profileImageTemp setBackgroundColor:[UIColor lightGrayColor]];
    [profileMainViewTemp addSubview:profileImageTemp];
    self.profileImage = profileImageTemp;
    
    UILabel *profileImageLabelTemp = [[UILabel alloc] init];
    [profileImageLabelTemp setFont:[UIFont systemFontOfSize:12]];
    [profileImageLabelTemp setTextColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1]];
    [profileMainViewTemp addSubview:profileImageLabelTemp];
    self.profileImageLabel = profileImageLabelTemp;
    
    UIButton *profileImageButtonTemp = [[UIButton alloc] init];
    [profileMainViewTemp addSubview:profileImageButtonTemp];
    self.profileImageButton = profileImageButtonTemp;
    
    [profileImageLabelTemp setText:@"Tab To change your pictrue"];
    
    
    /* ########## Profile First Name ########## */
    
    UIView  *profileFirstNameViewTemp = [[UIView alloc] init];
    [profileScrollViewTemp addSubview:profileFirstNameViewTemp];
    self.profileFirstNameView = profileFirstNameViewTemp;
    
    UILabel *profileFirstNameCaptionLabelTemp = [[UILabel alloc] init];
    [profileFirstNameCaptionLabelTemp setFont:[UIFont systemFontOfSize:12]];
    [profileFirstNameCaptionLabelTemp setTextColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1]];
    [profileFirstNameViewTemp addSubview:profileFirstNameCaptionLabelTemp];
    self.profileFirstNameCaptionLabel = profileFirstNameCaptionLabelTemp;
    
    UITextField *profileFirstNameLabelTemp = [[UITextField alloc] init];
    [profileFirstNameLabelTemp setFont:[UIFont systemFontOfSize:15]];
    [profileFirstNameLabelTemp setTextColor:[UIColor blackColor]];
    [profileFirstNameViewTemp addSubview:profileFirstNameLabelTemp];
    self.profileFirstNameLabel = profileFirstNameLabelTemp;
    
    UIView  *profileFirstNameBorderViewTemp = [[UIView alloc] init];
    [profileFirstNameBorderViewTemp setBackgroundColor:[UIColor lightGrayColor]];
    [profileFirstNameViewTemp addSubview:profileFirstNameBorderViewTemp];
    self.profileFirstNameBorderView = profileFirstNameBorderViewTemp;
    
    
    /* ########## Profile Last Name ########## */
    
    UIView  *profileLastNameViewTemp = [[UIView alloc] init];
    [profileScrollViewTemp addSubview:profileLastNameViewTemp];
    self.profileLastNameView = profileLastNameViewTemp;
    
    UILabel *profileLastNameCaptionLabelTemp = [[UILabel alloc] init];
    [profileLastNameCaptionLabelTemp setFont:[UIFont systemFontOfSize:12]];
    [profileLastNameCaptionLabelTemp setTextColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1]];
    [profileLastNameViewTemp addSubview:profileLastNameCaptionLabelTemp];
    self.profileLastNameCaptionLabel = profileLastNameCaptionLabelTemp;
    
    UITextField *profileLastNameLabelTemp = [[UITextField alloc] init];
    [profileLastNameLabelTemp setFont:[UIFont systemFontOfSize:15]];
    [profileLastNameLabelTemp setTextColor:[UIColor blackColor]];
    [profileLastNameViewTemp addSubview:profileLastNameLabelTemp];
    self.profileLastNameLabel = profileLastNameLabelTemp;
    
    UIView  *profileLastNameBorderViewTemp = [[UIView alloc] init];
    [profileLastNameBorderViewTemp setBackgroundColor:[UIColor lightGrayColor]];
    [profileLastNameViewTemp addSubview:profileLastNameBorderViewTemp];
    self.profileLastNameBorderView = profileLastNameBorderViewTemp;
    
    
    /* ########## Profile Trip Title ########## */
    
    UIView  *profileTripTitleViewTemp = [[UIView alloc] init];
    [profileScrollViewTemp addSubview:profileTripTitleViewTemp];
    self.profileTripTitleView = profileTripTitleViewTemp;
    
    UILabel *profileTripTitleCaptionLabelTemp = [[UILabel alloc] init];
    [profileTripTitleCaptionLabelTemp setFont:[UIFont systemFontOfSize:12]];
    [profileTripTitleCaptionLabelTemp setTextColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1]];
    [profileTripTitleViewTemp addSubview:profileTripTitleCaptionLabelTemp];
    self.profileTripTitleCaptionLabel = profileTripTitleCaptionLabelTemp;
    
    UITextField *profileTripTitleLabelTemp = [[UITextField alloc] init];
    [profileTripTitleLabelTemp setFont:[UIFont systemFontOfSize:15]];
    [profileTripTitleLabelTemp setTextColor:[UIColor blackColor]];
    [profileTripTitleViewTemp addSubview:profileTripTitleLabelTemp];
    self.profileTripTitleLabel = profileTripTitleLabelTemp;
    
    UIView  *profileTripTitleBorderViewTemp = [[UIView alloc] init];
    [profileTripTitleBorderViewTemp setBackgroundColor:[UIColor lightGrayColor]];
    [profileTripTitleViewTemp addSubview:profileTripTitleBorderViewTemp];
    self.profileTripTitleBorderView = profileTripTitleBorderViewTemp;
    
    
    /* ########## Profile Description ########## */
    
    UIView *profileDescriptionViewTemp = [[UIView alloc] init];
    [profileScrollViewTemp addSubview:profileDescriptionViewTemp];
    self.profileDescriptionView = profileDescriptionViewTemp;
    
    UILabel *profileDescriptionLabelTemp = [[UILabel alloc] init];
    [profileDescriptionLabelTemp setFont:[UIFont systemFontOfSize:12]];
    [profileDescriptionLabelTemp setTextColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1]];
    [profileDescriptionViewTemp addSubview:profileDescriptionLabelTemp];
    self.profileDescriptionLabel = profileDescriptionLabelTemp;
    
    UIImageView *profileDescriptionImageTemp = [[UIImageView alloc] init];
    [profileDescriptionViewTemp addSubview:profileDescriptionImageTemp];
    self.profileDescriptionImage = profileDescriptionImageTemp;
    
    UIButton *profileDescriptionButtonTemp = [[UIButton alloc] init];
    [profileDescriptionViewTemp addSubview:profileDescriptionButtonTemp];
    self.profileDescriptionButton = profileDescriptionButtonTemp;
    
}

- (void)setFrameProfileSettingView {
    
    CGFloat frameWidth = self.frame.size.width;
    
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    
    [self setFrame:CGRectMake(0, 0, frameWidth, self.frame.size.height)];
    [self.profileScrollView setFrame:CGRectMake(0, 0, frameWidth, self.frame.size.height)];
    
    [self.profileMainView setFrame:CGRectMake(offsetX, offsetY, frameWidth, 90)];
    
    [self.profileImageButton setFrame:self.profileMainView.frame];
    
    offsetY += self.profileMainView.frame.size.height;
    [self.profileImageBorderView setFrame:CGRectMake(offsetX, offsetY-1, frameWidth, 1)];
    
    CGFloat profileImageHeight = 40;
    
    offsetX = (self.profileMainView.frame.size.height-profileImageHeight) / 3;
    offsetY = (self.profileMainView.frame.size.height-profileImageHeight) / 2;
    
    [self.profileImage setFrame:CGRectMake(offsetX, offsetY, profileImageHeight, profileImageHeight)];
    [self.profileImage.layer setCornerRadius:self.profileImage.frame.size.height/2];
    [self.profileImage setImage:[UIImage imageWithData:[DataCenter sharedInstance].profileImage]];
    
    offsetX += self.profileImage.frame.size.width + 10;
    [self.profileImageLabel setFrame:CGRectMake(offsetX, offsetY, frameWidth - offsetX-20, self.profileImage.frame.size.height)];
    
    
    /* ########## Profile First Name ########## */
    
    offsetX = 0;
    offsetY = self.profileMainView.frame.size.height;
    
    [self.profileFirstNameView setFrame:CGRectMake(offsetX, offsetY, frameWidth, 70)];
    
    offsetX = 0;
    offsetY = self.profileFirstNameView.frame.size.height;
    
    [self.profileFirstNameBorderView setFrame:CGRectMake(offsetX, offsetY-1, frameWidth, 1)];
    
    offsetX = (self.profileMainView.frame.size.height-profileImageHeight) / 3;
    
    [self.profileFirstNameCaptionLabel setFrame:CGRectMake(offsetX, 0, 80, offsetY-1)];
    
    offsetX = self.profileFirstNameCaptionLabel.frame.size.width + 15;
    
    [self.profileFirstNameLabel setFrame:CGRectMake(offsetX, 0, frameWidth, offsetY-1)];
    
    self.profileFirstNameCaptionLabel.text = @"First Name";
    self.profileFirstNameLabel.text        = [DataCenter sharedInstance].firstName;
    
    
    /* ########## Profile Last Name ########## */
    
    offsetX = 0;
    offsetY = self.profileMainView.frame.size.height + self.profileFirstNameView.frame.size.height;
    
    [self.profileLastNameView setFrame:CGRectMake(offsetX, offsetY, frameWidth, 70)];
    
    offsetX = 0;
    offsetY = self.profileLastNameView.frame.size.height;
    
    [self.profileLastNameBorderView setFrame:CGRectMake(offsetX, offsetY-1, frameWidth, 1)];
    
    offsetX = (self.profileMainView.frame.size.height-profileImageHeight) / 3;
    
    [self.profileLastNameCaptionLabel setFrame:CGRectMake(offsetX, 0, 80, offsetY-1)];
    
    offsetX = self.profileLastNameCaptionLabel.frame.size.width + 15;
    
    [self.profileLastNameLabel setFrame:CGRectMake(offsetX, 0, frameWidth, offsetY-1)];
    
    self.profileLastNameCaptionLabel.text = @"Last Name";
    self.profileLastNameLabel.text        = [DataCenter sharedInstance].lastName;
    
    
    /* ########## Profile Trip Title ########## */
    
    offsetX = 0;
    offsetY = self.profileMainView.frame.size.height + self.profileFirstNameView.frame.size.height + self.profileLastNameView.frame.size.height;
    
    [self.profileTripTitleView setFrame:CGRectMake(offsetX, offsetY, frameWidth, 70)];
    
    offsetX = 0;
    offsetY = self.profileTripTitleView.frame.size.height;
    
    [self.profileTripTitleBorderView setFrame:CGRectMake(offsetX, offsetY-1, frameWidth, 1)];
    
    offsetX = (self.profileMainView.frame.size.height-profileImageHeight) / 3;
    
    [self.profileTripTitleCaptionLabel setFrame:CGRectMake(offsetX, 0, 80, offsetY-1)];
    
    offsetX = self.profileTripTitleCaptionLabel.frame.size.width + 15;
    
    [self.profileTripTitleLabel setFrame:CGRectMake(offsetX, 0, frameWidth, offsetY-1)];
    
    self.profileTripTitleCaptionLabel.text = @"Trip Title";
    self.profileTripTitleLabel.text        = [DataCenter sharedInstance].tripTitle;
    
    
    /* ########## Profile Trip Description ########## */
    
    offsetX = 0;
    offsetY = self.profileMainView.frame.size.height + self.profileFirstNameView.frame.size.height + self.profileLastNameView.frame.size.height + self.profileTripTitleView.frame.size.height;
    
    [self.profileDescriptionView setFrame:CGRectMake(offsetX, offsetY, frameWidth, self.frame.size.height - offsetY - 64)];
    [self.profileDescriptionButton setFrame:self.profileDescriptionView.bounds];
    
    offsetX = (self.profileMainView.frame.size.height-profileImageHeight) / 3;
    offsetY = 0;
    
    [self.profileDescriptionLabel setFrame:CGRectMake(offsetX, offsetY, frameWidth, 30)];
    [self.profileDescriptionLabel setText:@"Tab To change your pictrue"];
    
    offsetX = (self.profileMainView.frame.size.height-profileImageHeight) / 3;
    offsetY = self.profileDescriptionLabel.frame.size.height;
    
    [self.profileDescriptionImage setFrame:CGRectMake(offsetX, offsetY, frameWidth-(offsetX*2), self.profileDescriptionView.frame.size.height - self.profileDescriptionLabel.frame.size.height-offsetX)];
    [self.profileDescriptionImage setImage:[UIImage imageWithData:[DataCenter sharedInstance].desctiprionImage]];
}

- (void)settingProfileImage:(UIImage *)image {
    
    [self.profileImage setImage:image];
}

- (void)settingDescriptionImage:(UIImage *)image {
    
    [self.profileDescriptionImage setImage:image];
}

@end
