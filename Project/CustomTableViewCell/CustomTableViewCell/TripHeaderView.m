//
//  TripHeaderView.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 21..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "TripHeaderView.h"
#import "DataCenter.h"

@interface TripHeaderView()

@property (nonatomic, weak) UIImageView *profileInfoView;
@property (nonatomic, weak) UIView      *profileInfoMaskView;
@property (nonatomic, weak) UIImageView *profileImageView;
@property (nonatomic, weak) UILabel     *profileNameLabel;
@property (nonatomic, weak) UIView      *profileUnderBarView;
@property (nonatomic, weak) UILabel     *profileTripTitleLabel;
@property (nonatomic, weak) UILabel     *profileTripYearLabel;
@property (nonatomic, weak) UILabel     *profileTripStatusLabel;

@property (nonatomic, weak) UIView      *tripInfoView;
@property (nonatomic, weak) UILabel     *tripKmLabel;
@property (nonatomic, weak) UILabel     *tripKmCaptionLabel;
@property (nonatomic, weak) UILabel     *tripViewsLabel;
@property (nonatomic, weak) UILabel     *tripViewsCaptionLabel;
@property (nonatomic, weak) UILabel     *tripLikesLabel;
@property (nonatomic, weak) UILabel     *tripLikesCaptionLabel;
@property (nonatomic, weak) UILabel     *tripDaysLabel;
@property (nonatomic, weak) UILabel     *tripDaysCaptionLabel;
@property (nonatomic, weak) UILabel     *tripCuntriesLabel;
@property (nonatomic, weak) UILabel     *tripCuntriesCaptionLabel;
@property (nonatomic, weak) UILabel     *tripStepsLabel;
@property (nonatomic, weak) UILabel     *tripStepsCaptionLabel;


@property (nonatomic, weak) UIImageView *mapInfoView;

@property (nonatomic, weak) UIView      *tripStartView;
@property (nonatomic, weak) UIImageView *tripStartImageView;
@property (nonatomic, weak) UILabel     *tripStartLabel;
@property (nonatomic, weak) UILabel     *tripStartDateLabel;

@end

@implementation TripHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if(self) {
        
        /* Draw View */
        [self drawTripHeaderView];
        
        /* Frame Setting */
        [self settingTripHeaderFrame];
        
        [self settingTripHeaderFrameBackground];
    }
    
    return self;
    
}

- (void)drawTripHeaderView {
    /* ########## Profile Start ########## */
    
    /* Profile Main View */
    UIImageView *profileInfoViewTemp = [[UIImageView alloc] init];
    [profileInfoViewTemp setContentMode:UIViewContentModeScaleToFill];
    [self addSubview:profileInfoViewTemp];
    
    self.profileInfoView = profileInfoViewTemp;
    
    
    /* profile Main Mask View */
    UIView *profileInfoMaskViewTemp = [[UIView alloc] init];
    [profileInfoViewTemp addSubview:profileInfoMaskViewTemp];
    [profileInfoMaskViewTemp setBackgroundColor:[UIColor blackColor]];
    [profileInfoMaskViewTemp setAlpha:0.3];
    self.profileInfoMaskView = profileInfoMaskViewTemp;
    
    /* Profile User ImageView */
    UIImageView *profileImageViewTemp = [[UIImageView alloc] init];
    [profileImageViewTemp setClipsToBounds:YES];
    [profileInfoViewTemp addSubview:profileImageViewTemp];
    
    self.profileImageView = profileImageViewTemp;
    
    /* Profile User Name Label */
    UILabel *profileNameLabelTemp = [[UILabel alloc] init];
    [profileNameLabelTemp setTextColor:[UIColor whiteColor]];
    [profileNameLabelTemp setFont:[UIFont boldSystemFontOfSize:13]];
    
    [profileInfoViewTemp addSubview:profileNameLabelTemp];
    self.profileNameLabel = profileNameLabelTemp;
    
    /* Profile Image UnderBar View */
    UIView *profileUnderBarViewTemp = [[UIView alloc] init];
    [profileUnderBarViewTemp setBackgroundColor:[UIColor colorWithRed:71/255.0 green:174/255.0 blue:162/255.0 alpha:1]];
    
    [profileInfoViewTemp addSubview:profileUnderBarViewTemp];
    self.profileUnderBarView = profileUnderBarViewTemp;
    
    
    /* Profile Trip Title Label */
    UILabel *profileTripTitleLabelTemp = [[UILabel alloc] init];
    [profileTripTitleLabelTemp setTextColor:[UIColor whiteColor]];
    [profileTripTitleLabelTemp setFont:[UIFont boldSystemFontOfSize:30]];
    
    [profileInfoViewTemp addSubview:profileTripTitleLabelTemp];
    self.profileTripTitleLabel = profileTripTitleLabelTemp;
    
    /* Profile Trip Title Label */
    UILabel *profileTripYearLabelTemp = [[UILabel alloc] init];
    [profileTripYearLabelTemp setFont:[UIFont boldSystemFontOfSize:11]];
    [profileTripYearLabelTemp setTextColor:[UIColor whiteColor]];
    [profileTripYearLabelTemp setBackgroundColor:[UIColor colorWithRed:26/255.0 green:36/255.0 blue:48/255.0 alpha:1]];
    [profileTripYearLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [profileInfoViewTemp addSubview:profileTripYearLabelTemp];
    self.profileTripYearLabel = profileTripYearLabelTemp;
    
    /* Profile Trip Status Label */
    UILabel *profileTripStatusLabelTemp = [[UILabel alloc] init];
    [profileTripStatusLabelTemp setFont:[UIFont boldSystemFontOfSize:11]];
    [profileTripStatusLabelTemp setTextColor:[UIColor whiteColor]];
    [profileTripStatusLabelTemp setBackgroundColor:[UIColor colorWithRed:189/255.0 green:38/255.0 blue:79/255.0 alpha:1]];
    [profileTripStatusLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [profileInfoViewTemp addSubview:profileTripStatusLabelTemp];
    self.profileTripStatusLabel = profileTripStatusLabelTemp;
    
    /* ########## Profile End ########## */
    
    
    /* ########## Trip Info Start ########## */
    UIView  *tripInfoViewTemp = [[UIView alloc] init];
    [self addSubview:tripInfoViewTemp];
    self.tripInfoView = tripInfoViewTemp;
    
    UILabel *tripKmLabelTemp = [[UILabel alloc] init];
    [tripKmLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripKmLabelTemp setTextColor:[UIColor colorWithRed:84/255.0 green:91/255.0 blue:99/255.0 alpha:1]];
    [tripKmLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripKmLabelTemp];
    self.tripKmLabel = tripKmLabelTemp;
    
    UILabel *tripKmCaptionLabelTemp = [[UILabel alloc] init];
    [tripKmCaptionLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripKmCaptionLabelTemp setTextColor:[UIColor colorWithRed:145/255.0 green:152/255.0 blue:161/255.0 alpha:1]];
    [tripKmCaptionLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripKmCaptionLabelTemp];
    self.tripKmCaptionLabel = tripKmCaptionLabelTemp;
    
    UILabel *tripViewsLabelTemp = [[UILabel alloc] init];
    [tripViewsLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripViewsLabelTemp setTextColor:[UIColor colorWithRed:84/255.0 green:91/255.0 blue:99/255.0 alpha:1]];
    [tripViewsLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripViewsLabelTemp];
    self.tripViewsLabel = tripViewsLabelTemp;
    
    UILabel *tripViewsCaptionLabelTemp = [[UILabel alloc] init];
    [tripViewsCaptionLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripViewsCaptionLabelTemp setTextColor:[UIColor colorWithRed:145/255.0 green:152/255.0 blue:161/255.0 alpha:1]];
    [tripViewsCaptionLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripViewsCaptionLabelTemp];
    self.tripViewsCaptionLabel = tripViewsCaptionLabelTemp;
    
    UILabel *tripLikesLabelTemp = [[UILabel alloc] init];
    [tripLikesLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripLikesLabelTemp setTextColor:[UIColor colorWithRed:84/255.0 green:91/255.0 blue:99/255.0 alpha:1]];
    [tripLikesLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripLikesLabelTemp];
    self.tripLikesLabel = tripLikesLabelTemp;
    
    UILabel *tripLikesCaptionLabelTemp = [[UILabel alloc] init];
    [tripLikesCaptionLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripLikesCaptionLabelTemp setTextColor:[UIColor colorWithRed:145/255.0 green:152/255.0 blue:161/255.0 alpha:1]];
    [tripLikesCaptionLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripLikesCaptionLabelTemp];
    self.tripLikesCaptionLabel = tripLikesCaptionLabelTemp;
    
    UILabel *tripDaysLabelTemp = [[UILabel alloc] init];
    [tripDaysLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripDaysLabelTemp setTextColor:[UIColor colorWithRed:84/255.0 green:91/255.0 blue:99/255.0 alpha:1]];
    [tripDaysLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripDaysLabelTemp];
    self.tripDaysLabel = tripDaysLabelTemp;
    
    UILabel *tripDaysCaptionLabelTemp = [[UILabel alloc] init];
    [tripDaysCaptionLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripDaysCaptionLabelTemp setTextColor:[UIColor colorWithRed:145/255.0 green:152/255.0 blue:161/255.0 alpha:1]];
    [tripDaysCaptionLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripDaysCaptionLabelTemp];
    self.tripDaysCaptionLabel = tripDaysCaptionLabelTemp;
    
    UILabel *tripCuntriesLabelTemp = [[UILabel alloc] init];
    [tripCuntriesLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripCuntriesLabelTemp setTextColor:[UIColor colorWithRed:84/255.0 green:91/255.0 blue:99/255.0 alpha:1]];
    [tripCuntriesLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripCuntriesLabelTemp];
    self.tripCuntriesLabel = tripCuntriesLabelTemp;
    
    UILabel *tripCuntriesCaptionLabelTemp = [[UILabel alloc] init];
    [tripCuntriesCaptionLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripCuntriesCaptionLabelTemp setTextColor:[UIColor colorWithRed:145/255.0 green:152/255.0 blue:161/255.0 alpha:1]];
    [tripCuntriesCaptionLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripCuntriesCaptionLabelTemp];
    self.tripCuntriesCaptionLabel = tripCuntriesCaptionLabelTemp;
    
    
    UILabel *tripStepsLabelTemp = [[UILabel alloc] init];
    [tripStepsLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripStepsLabelTemp setTextColor:[UIColor colorWithRed:84/255.0 green:91/255.0 blue:99/255.0 alpha:1]];
    [tripStepsLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripStepsLabelTemp];
    self.tripStepsLabel = tripStepsLabelTemp;
    
    UILabel *tripStepsCaptionLabelTemp = [[UILabel alloc] init];
    [tripStepsCaptionLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripStepsCaptionLabelTemp setTextColor:[UIColor colorWithRed:145/255.0 green:152/255.0 blue:161/255.0 alpha:1]];
    [tripStepsCaptionLabelTemp setTextAlignment:NSTextAlignmentCenter];
    
    [tripInfoViewTemp addSubview:tripStepsCaptionLabelTemp];
    self.tripStepsCaptionLabel = tripStepsCaptionLabelTemp;
    
    /* ########## Trip Info End ########## */
    
    
    /* ########## Map Info Start ########## */
    
    UIImageView *mapInfoViewTemp = [[UIImageView alloc] init];
    [self addSubview:mapInfoViewTemp];
    self.mapInfoView = mapInfoViewTemp;
    
    /* ########## Map Info End ########## */
    
    
    /* ########## Trip Start Start ########## */
    
    UIView *tripStartViewTemp = [[UIView alloc] init];
    [self addSubview:tripStartViewTemp];
    self.tripStartView = tripStartViewTemp;
    
    UIImageView *tripStartImageViewTemp = [[UIImageView alloc] init];
    [tripStartImageViewTemp setContentMode:UIViewContentModeCenter];
    [tripStartImageViewTemp setBackgroundColor:[UIColor whiteColor]];
    [tripStartImageViewTemp setClipsToBounds:YES];
    [tripStartViewTemp addSubview:tripStartImageViewTemp];
    self.tripStartImageView = tripStartImageViewTemp;
    
    UILabel *tripStartLabelTemp = [[UILabel alloc] init];
    [tripStartLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripStartLabelTemp setTextColor:[UIColor colorWithRed:84/255.0 green:91/255.0 blue:99/255.0 alpha:1]];
    [tripStartViewTemp addSubview:tripStartLabelTemp];
    self.tripStartLabel = tripStartLabelTemp;
    
    UILabel *tripStartDateLabelTemp = [[UILabel alloc] init];
    [tripStartDateLabelTemp setFont:[UIFont boldSystemFontOfSize:11]];
    [tripStartDateLabelTemp setTextColor:[UIColor colorWithRed:84/255.0 green:91/255.0 blue:99/255.0 alpha:1]];
    [tripStartViewTemp addSubview:tripStartDateLabelTemp];
    self.tripStartDateLabel = tripStartDateLabelTemp;
    
    /* ########## Trip Start End ########## */
    
    
    //[self.profileInfoView setImage:[UIImage imageNamed:@"profile.jpg"]];
    [self.profileInfoView setImage:[UIImage imageWithData:[DataCenter sharedInstance].desctiprionImage]];
    //[self.profileImageView setImage:[UIImage imageNamed:@"profile"]];
    [self.profileImageView setImage:[UIImage imageWithData:[DataCenter sharedInstance].profileImage]];
    
    self.profileNameLabel.text       = [NSString stringWithFormat:@"%@ %@", [DataCenter sharedInstance].firstName, [DataCenter sharedInstance].lastName];
    self.profileTripTitleLabel.text  = [DataCenter sharedInstance].tripTitle;
    self.profileTripYearLabel.text   = @"2017";
    self.profileTripStatusLabel.text = @"NOW TRAVELLING";
    
    self.tripKmLabel.text              = @"21,612";
    self.tripKmCaptionLabel.text       = @"KILOMETERS";
    self.tripViewsLabel.text           = @"1";
    self.tripViewsCaptionLabel.text    = @"VIEWS";
    self.tripLikesLabel.text           = @"0";
    self.tripLikesCaptionLabel.text    = @"LIKES";
    self.tripDaysLabel.text            = @"7/93";
    self.tripDaysCaptionLabel.text     = @"DAYS";
    self.tripCuntriesLabel.text        = @"2";
    self.tripCuntriesCaptionLabel.text = @"COUNTRIES";
    self.tripStepsLabel.text           = @"5";
    self.tripStepsCaptionLabel.text    = @"STEPS";
    
    [self.mapInfoView setImage:[UIImage imageNamed:@"mapImage"]];
    
    /*
    UIImage *img1 = [[UIImage alloc] init];
    img1 = [UIImage imageNamed:@"home"];
    
    // UIImage 사이즈 변환
    CGRect rect = CGRectMake(0,0,14,14);
    UIGraphicsBeginImageContext( rect.size );
    [img1 drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *img=[UIImage imageWithData:imageData];
    */
    
    [self.tripStartImageView setImage:[UIImage imageNamed:@"home"]];
    [self.tripStartLabel setText:@"Trip Started"];
    [self.tripStartDateLabel setText:@"Hello World"];
}

- (void)settingTripHeaderFrame {
    
    const CGFloat MARGIN = 20;
    
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    
    /* ########## Profile Info Start ########## */
    
    [self.profileInfoView setFrame:CGRectMake(offsetX, offsetY, self.frame.size.width, self.frame.size.width-20)];
    [self.profileInfoMaskView setFrame:self.profileInfoView.bounds];
    
    offsetX += MARGIN;
    offsetY += self.frame.size.width - 140 - 20;
    
    [self.profileImageView setFrame:CGRectMake(offsetX, offsetY, 30, 30)];
    [self.profileImageView.layer setCornerRadius:self.profileImageView.frame.size.height/2];
    
    offsetX += self.profileImageView.frame.size.width + (MARGIN/2);
    
    [self.profileNameLabel setFrame:CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX - MARGIN, self.profileImageView.frame.size.height)];
    
    offsetX = MARGIN;
    offsetY += self.profileImageView.frame.size.height + (MARGIN / 2) - 2;
    
    [self.profileUnderBarView setFrame:CGRectMake(offsetX, offsetY, self.profileImageView.frame.size.width, 2)];
    
    offsetY += (MARGIN / 2);
    
    [self.profileTripTitleLabel setFrame:CGRectMake(offsetX, offsetY, self.frame.size.width - offsetX - MARGIN, 40)];
    
    offsetY += self.profileTripTitleLabel.frame.size.height + (MARGIN/2);
    
    [self.profileTripYearLabel setFrame:CGRectMake(offsetX, offsetY, 43, 27)];
    
    offsetX += self.profileTripYearLabel.frame.size.width + (MARGIN/2);
    
    [self.profileTripStatusLabel setFrame:CGRectMake(offsetX, offsetY, 111, 27)];
    
    
    /* ########## Trip Info Start ##########
    
    CGFloat avgWidth  = self.frame.size.width / 3;
    CGFloat avgHeight = 135/4.0;
    
    offsetX = 0;
    offsetY = self.profileInfoView.frame.size.height;
    [self.tripInfoView setFrame:CGRectMake(offsetX, offsetY, self.frame.size.width, 135)];
    
    offsetX = 0;
    offsetY = 15;
    [self.tripKmLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX += avgWidth;
    [self.tripViewsLabel  setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX += avgWidth;
    [self.tripLikesLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX = 0;
    offsetY += avgHeight - 15;
    [self.tripKmCaptionLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX += avgWidth;
    [self.tripViewsCaptionLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX += avgWidth;
    [self.tripLikesCaptionLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX = 0;
    offsetY += avgHeight ;
    [self.tripDaysLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX += avgWidth;
    [self.tripCuntriesLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX += avgWidth;
    [self.tripStepsLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    return cell;
    offsetX = 0;
    offsetY += avgHeight - 15;
    [self.tripDaysCaptionLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX += avgWidth;
    [self.tripCuntriesCaptionLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    
    offsetX += avgWidth;
    [self.tripStepsCaptionLabel setFrame:CGRectMake(offsetX, offsetY, avgWidth, avgHeight)];
    */
    
    
    /* ########## Map Info Start ##########
    
    offsetX = 0;
    offsetY = self.profileInfoView.frame.size.height + self.tripInfoView.frame.size.height;
    
    [self.mapInfoView setFrame:CGRectMake(offsetX, offsetY, self.frame.size.width, self.frame.size.width)];
    */
    
    /* ########## Trip Start ########## */
    
    offsetX = 0;
    offsetY = self.profileInfoView.frame.size.height + self.tripInfoView.frame.size.height + self.mapInfoView.frame.size.height;
    
    [self.tripStartView setFrame:CGRectMake(offsetX, offsetY, self.frame.size.width, 65)];
    
    [self.tripStartImageView setFrame:CGRectMake(20, 25, 28, 28)];
    [self.tripStartImageView.layer setCornerRadius:self.tripStartImageView.frame.size.height / 2];
    
    [self.tripStartLabel setFrame:CGRectMake(58, 26, 150, 12)];
    [self.tripStartDateLabel setFrame:CGRectMake(58, 42, 150, 11)];
}

- (void)settingTripHeaderFrameBackground {
    
    [self.tripInfoView setBackgroundColor:[UIColor whiteColor]];
    [self.tripStartView setBackgroundColor:[UIColor colorWithRed:233/255.0 green:234/255.0 blue:236/255.0 alpha:1]];
    
}

- (void)settingTripViewInfo {
    
    self.profileNameLabel.text      = [NSString stringWithFormat:@"%@ %@", [DataCenter sharedInstance].firstName,
                                       [DataCenter sharedInstance].lastName];
    self.profileTripTitleLabel.text = [DataCenter sharedInstance].tripTitle;
    
    [self.profileInfoView  setImage:[UIImage imageWithData:[DataCenter sharedInstance].desctiprionImage]];
    [self.profileImageView setImage:[UIImage imageWithData:[DataCenter sharedInstance].profileImage]];
}
@end
