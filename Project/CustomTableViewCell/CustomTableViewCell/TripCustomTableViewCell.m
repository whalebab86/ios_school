//
//  TripCustomTableViewCell.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 25..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "TripCustomTableViewCell.h"

@interface TripCustomTableViewCell ()

@property (nonatomic, weak) UIView      *headerView;
@property (nonatomic, weak) UIView      *headerTopBoarderView;
@property (nonatomic, weak) UIImageView *headerAddImageView;
@property (nonatomic, weak) UILabel     *headerAddLabel;
@property (nonatomic, weak) UIView      *headerBottomBoarderView;
@property (nonatomic, weak) UIButton    *headerAddButton;

@property (nonatomic, weak) UIView      *bodyView;

@property (nonatomic, weak) UIView      *locationInfoView;
//@property (nonatomic, weak) UILabel     *locationInfoLabel;
//@property (nonatomic, weak) UIImageView *locationImage;
//@property (nonatomic, weak) UILabel     *locationInfoSubLabel;

@property (nonatomic, weak) UIView      *contentInfoView;
//@property (nonatomic, weak) UIImageView *contentImageView;

@property (nonatomic, weak) UIView      *tripInfoView;
@property (nonatomic, weak) UIView      *tripInfoDateView;
@property (nonatomic, weak) UIView      *tripInfoDayView;
//@property (nonatomic, weak) UILabel     *tripInfoDayLabel;
//@property (nonatomic, weak) UILabel     *tripInfoDateLabel;
@property (nonatomic, weak) UIView      *tripInfoDateBoarderView;
@property (nonatomic, weak) UIView      *tripInfoButtonView;

@property (nonatomic, weak) UIButton    *tripInfoLikeButton;
@property (nonatomic, weak) UIButton    *tripInfoShowMapButton;
@property (nonatomic, weak) UIButton    *tripInfoShareButton;
@property (nonatomic, weak) UIButton    *tripInfoWriteButton;

@end

@implementation TripCustomTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews {
    
    [self settingCustomCellFrame];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    [self.contentView setBackgroundColor:[UIColor colorWithRed:233/255.0 green:234/255.0 blue:236/255.0 alpha:1]];
    
    if (self) {
        /* View Draw */
        [self customCellSubView];
        
        /* View Frame Setting */
        [self settingCustomCellFrame];
    }
    
    return self;
}

- (void)customCellSubView {
    
    /* ########## Header View ########## */
    UIView *headerViewTemp = [[UIView alloc] init];
    [self.contentView addSubview:headerViewTemp];
    self.headerView = headerViewTemp;
    
    UIView *headerTopBoarderViewTemp = [[UIView alloc] init];
    [headerTopBoarderViewTemp setBackgroundColor:[UIColor lightGrayColor]];
    [headerViewTemp addSubview:headerTopBoarderViewTemp];
    self.headerTopBoarderView = headerTopBoarderViewTemp;
    
    UIImageView *headerAddImageViewTemp = [[UIImageView alloc] init];
    [headerAddImageViewTemp setImage:[UIImage imageNamed:@"plus"]];
    [headerViewTemp addSubview:headerAddImageViewTemp];
    self.headerAddImageView = headerAddImageViewTemp;
    
    UILabel *headerAddLabelTemp = [[UILabel alloc] init];
    [headerAddLabelTemp setText:@"Traveled for a bit"];
    [headerAddLabelTemp setFont:[UIFont systemFontOfSize:13]];
    [headerAddLabelTemp setTextColor:[UIColor colorWithRed:145/255.0 green:151/255.0 blue:161/255.0 alpha:1]];
    
    [headerViewTemp addSubview:headerAddLabelTemp];
    self.headerAddLabel = headerAddLabelTemp;
    
    UIView *headerBottomBoarderViewTemp = [[UIView alloc] init];
    [headerBottomBoarderViewTemp setBackgroundColor:[UIColor lightGrayColor]];
    [headerViewTemp addSubview:headerBottomBoarderViewTemp];
    self.headerBottomBoarderView = headerBottomBoarderViewTemp;
    
    UIButton *headerAddButtonTemp = [[UIButton alloc] init];
    [headerViewTemp addSubview:headerAddButtonTemp];
    [headerAddButtonTemp setUserInteractionEnabled:YES];
    [headerAddButtonTemp addTarget:self action:@selector(didTestClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerAddButtonTemp setAccessibilityIdentifier:@"headerAddButton"];
    self.headerAddButton = headerAddButtonTemp;
    
    /* ########## Body View ########## */
    UIView *bodyViewTemp = [[UIView alloc] init];
    [bodyViewTemp setClipsToBounds:YES];
    [bodyViewTemp.layer setCornerRadius:8];
    [self.contentView addSubview:bodyViewTemp];
    self.bodyView = bodyViewTemp;
    
    
    /* ########## Body - location View ########## */
    UIView *locationInfoViewTemp = [[UIView alloc] init];
    [bodyViewTemp addSubview:locationInfoViewTemp];
    self.locationInfoView = locationInfoViewTemp;
    
    UILabel *locationInfoLabelTemp = [[UILabel alloc] init];
    [locationInfoLabelTemp setFont:[UIFont boldSystemFontOfSize:25]];
    [locationInfoLabelTemp setTextColor:[UIColor colorWithRed:188/255.0 green:39/255.0 blue:79/255.0 alpha:1]];
    [locationInfoViewTemp addSubview:locationInfoLabelTemp];
    self.locationInfoLabel = locationInfoLabelTemp;
    
    UIImageView *locationImageTemp = [[UIImageView alloc] init];
    [locationImageTemp.layer setBorderColor:[UIColor colorWithRed:235/255.0 green:237/255.0 blue:239/255.0 alpha:1].CGColor];
    //[locationImageTemp.layer setBorderWidth:1];
    //[locationImageTemp setContentMode:UIViewContentModeScaleAspectFill];
    [locationInfoViewTemp addSubview:locationImageTemp];
    self.locationImage = locationImageTemp;
    
    UILabel *locationInfoSubLabelTemp = [[UILabel alloc] init];
    [locationInfoSubLabelTemp setFont:[UIFont boldSystemFontOfSize:20]];
    [locationInfoSubLabelTemp setTextColor:[UIColor blackColor]];
    [locationInfoViewTemp addSubview:locationInfoSubLabelTemp];
    self.locationInfoSubLabel = locationInfoSubLabelTemp;
    
    /* ########## Body - content View ########## */
    UIView *contentInfoViewTemp = [[UIView alloc] init];
    [bodyViewTemp addSubview:contentInfoViewTemp];
    self.contentInfoView = contentInfoViewTemp;
    
    UIImageView *contentImageViewTemp = [[UIImageView alloc] init];
    [contentImageViewTemp setContentMode:UIViewContentModeScaleToFill];
    [contentInfoViewTemp addSubview:contentImageViewTemp];
    self.contentImageView = contentImageViewTemp;
    
    /* ########## Body - trip info View ########## */
    UIView *tripInfoViewTemp = [[UIView alloc] init];
    [bodyViewTemp addSubview:tripInfoViewTemp];
    self.tripInfoView = tripInfoViewTemp;
    
    
    UIView *tripInfoDateViewTemp = [[UIView alloc] init];
    [tripInfoViewTemp addSubview:tripInfoDateViewTemp];
    self.tripInfoDateView = tripInfoDateViewTemp;
    
    UIView *tripInfoDayViewTemp = [[UIView alloc] init];
    [tripInfoDayViewTemp setBackgroundColor:[UIColor lightGrayColor]];
    [tripInfoDayViewTemp.layer setCornerRadius:5];
    [tripInfoDateViewTemp addSubview:tripInfoDayViewTemp];
    self.tripInfoDayView = tripInfoDayViewTemp;
    
    UILabel *tripInfoDayLabelTemp = [[UILabel alloc] init];
    [tripInfoDayLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripInfoDayLabelTemp setTextColor:[UIColor whiteColor]];
    [tripInfoDateViewTemp addSubview:tripInfoDayLabelTemp];
    self.tripInfoDayLabel = tripInfoDayLabelTemp;
    
    UILabel *tripInfoDateLabelTemp = [[UILabel alloc] init];
    [tripInfoDateLabelTemp setFont:[UIFont boldSystemFontOfSize:12]];
    [tripInfoDateLabelTemp setTextColor:[UIColor whiteColor]];
    [tripInfoDateLabelTemp setTextAlignment:NSTextAlignmentRight];
    [tripInfoDateViewTemp addSubview:tripInfoDateLabelTemp];
    self.tripInfoDateLabel = tripInfoDateLabelTemp;
    
    UIView *tripInfoDateBoarderViewTemp = [[UIView alloc] init];
    [tripInfoViewTemp addSubview:tripInfoDateBoarderViewTemp];
    self.tripInfoDateBoarderView = tripInfoDateBoarderViewTemp;
    
    UIView *tripInfoButtonViewTemp = [[UIView alloc] init];
    [tripInfoViewTemp addSubview:tripInfoButtonViewTemp];
    self.tripInfoButtonView = tripInfoButtonViewTemp;
    
    UIButton *tripInfoLikeButtonTemp = [UIButton buttonWithType:UIButtonTypeCustom];
    [tripInfoLikeButtonTemp addTarget:self action:@selector(didTestClick:) forControlEvents:UIControlEventTouchUpInside];
    [tripInfoLikeButtonTemp setAccessibilityIdentifier:@"likeButton"];
    [tripInfoButtonViewTemp addSubview:tripInfoLikeButtonTemp];
    self.tripInfoLikeButton = tripInfoLikeButtonTemp;
    
    UIButton *tripInfoShowMapButtonTemp = [UIButton buttonWithType:UIButtonTypeCustom];
    [tripInfoShowMapButtonTemp setAccessibilityIdentifier:@"showMapButton"];
    [tripInfoShowMapButtonTemp addTarget:self action:@selector(didTestClick:) forControlEvents:UIControlEventTouchUpInside];
    [tripInfoButtonViewTemp addSubview:tripInfoShowMapButtonTemp];
    self.tripInfoShowMapButton = tripInfoShowMapButtonTemp;
    
    UIButton *tripInfoShareButtonTemp = [UIButton buttonWithType:UIButtonTypeCustom];
    [tripInfoShareButtonTemp setAccessibilityIdentifier:@"shareButton"];
    [tripInfoShareButtonTemp addTarget:self action:@selector(didTestClick:) forControlEvents:UIControlEventTouchUpInside];
    [tripInfoButtonViewTemp addSubview:tripInfoShareButtonTemp];
    self.tripInfoShareButton = tripInfoShareButtonTemp;
    
    UIButton *tripInfoWriteButtonTemp = [UIButton buttonWithType:UIButtonTypeCustom];
    [tripInfoWriteButtonTemp setAccessibilityIdentifier:@"writeButton"];
    [tripInfoWriteButtonTemp addTarget:self action:@selector(didTestClick:) forControlEvents:UIControlEventTouchUpInside];
    [tripInfoButtonViewTemp addSubview:tripInfoWriteButtonTemp];
    self.tripInfoWriteButton = tripInfoWriteButtonTemp;
    
    [self.headerView setBackgroundColor:[UIColor clearColor]];
    [self.bodyView setBackgroundColor:[UIColor whiteColor]];
    
    [self.contentInfoView setBackgroundColor:[UIColor greenColor]];
    [self.contentImageView setBackgroundColor:[UIColor whiteColor]];
    //[self.tripInfoView setBackgroundColor:[UIColor blueColor]];
    
    //[self.tripInfoDateView setBackgroundColor:[UIColor blueColor]];
    [self.tripInfoDateBoarderView setBackgroundColor:[UIColor lightGrayColor]];
    //[self.tripInfoButtonView setBackgroundColor:[UIColor redColor]];
    
    [locationImageTemp setImage:[UIImage imageNamed:@"south-korea"]];
    [locationInfoLabelTemp setText:@"Seoul"];
    [locationInfoSubLabelTemp setText:@"South korea"];
    
    [contentImageViewTemp setImage:[UIImage imageNamed:@"profile.jpg"]];
    
    [self.tripInfoDayLabel setText:@"DAY1"];
    
    [self.tripInfoDayLabel setTextAlignment:NSTextAlignmentCenter];
    [self.tripInfoDateLabel setText:@"1 week ago"];
    [self.tripInfoDateLabel setTextColor:[UIColor lightGrayColor]];
    
    [self.tripInfoLikeButton setImage:[UIImage imageNamed:@"btnLike"] forState:UIControlStateNormal];
    [self.tripInfoShowMapButton setImage:[UIImage imageNamed:@"btnPlaceholder"] forState:UIControlStateNormal];
    [self.tripInfoShareButton setImage:[UIImage imageNamed:@"btnDelete"] forState:UIControlStateNormal];
    [self.tripInfoWriteButton setImage:[UIImage imageNamed:@"btnEdit"] forState:UIControlStateNormal];
    
    [self.tripInfoLikeButton setImageEdgeInsets:UIEdgeInsetsMake(6.5, 6.5, 6.5, 6.5)];
    [self.tripInfoShowMapButton setImageEdgeInsets:UIEdgeInsetsMake(6.5, 6.5, 6.5, 90)];
    [self.tripInfoShowMapButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [self.tripInfoShareButton setImageEdgeInsets:UIEdgeInsetsMake(6.5, 6.5, 6.5, 6.5)];
    [self.tripInfoWriteButton setImageEdgeInsets:UIEdgeInsetsMake(6.5, 6.5, 6.5, 6.5)];
    
    [self.tripInfoShowMapButton setTitle:@"Show on map" forState:UIControlStateNormal];
    [self.tripInfoShowMapButton setTitleColor:[UIColor colorWithRed:78/255.0 green:175/255.0 blue:163/255.0 alpha:1] forState:UIControlStateNormal];
    [self.tripInfoShowMapButton setTitleColor:[UIColor colorWithRed:93/255.0 green:131/255.0 blue:125/255.0 alpha:1] forState:UIControlStateHighlighted];
    [self.tripInfoShowMapButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    
    [self.tripInfoLikeButton.layer setCornerRadius:5];
    [self.tripInfoShowMapButton.layer setCornerRadius:5];
    [self.tripInfoShareButton.layer setCornerRadius:5];
    [self.tripInfoWriteButton.layer setCornerRadius:5];
    
    [self.tripInfoLikeButton setClipsToBounds:YES];
    [self.tripInfoShowMapButton setClipsToBounds:YES];
    [self.tripInfoShareButton setClipsToBounds:YES];
    [self.tripInfoWriteButton setClipsToBounds:YES];
    
    UIColor *borderColor = [UIColor colorWithRed:179/255.0 green:184/255.0 blue:189/255.0 alpha:1];
    
    [self.tripInfoLikeButton.layer setBorderColor:borderColor.CGColor];
    [self.tripInfoLikeButton.layer setBorderWidth:1];
    [self.tripInfoShowMapButton.layer setBorderColor:borderColor.CGColor];
    [self.tripInfoShowMapButton.layer setBorderWidth:1];
    [self.tripInfoShareButton.layer setBorderColor:borderColor.CGColor];
    [self.tripInfoShareButton.layer setBorderWidth:1];
    [self.tripInfoWriteButton.layer setBorderColor:borderColor.CGColor];
    [self.tripInfoWriteButton.layer setBorderWidth:1];
}

- (void)settingCustomCellFrame {
    
    CGFloat frameWidth = self.frame.size.width;
    
    CGFloat offsetX;
    CGFloat offsetY;
    
    const CGFloat MARGIN = 5;
    
    offsetX = 0;
    offsetY = 0;
    
    /* ########## Header View ########## */
    [self.headerView setFrame:CGRectMake(offsetX, offsetY, frameWidth, 70)];
    
    offsetX += MARGIN;
    offsetY = self.headerView.frame.size.height;
    
    offsetX = 33;
    offsetY = MARGIN;
    [self.headerTopBoarderView setFrame:CGRectMake(offsetX, offsetY, 1, 13)];
    
    offsetX = 33 - (25/2);
    offsetY += self.headerTopBoarderView.frame.size.height + MARGIN;
    [self.headerAddImageView setFrame:CGRectMake(offsetX, offsetY, 25, 25)];
    
    offsetX += self.headerAddImageView.frame.size.width + (MARGIN * 2);
    [self.headerAddLabel setFrame:CGRectMake(offsetX, offsetY, 150, self.headerAddImageView.frame.size.height)];
    
    offsetX = 33;
    offsetY += self.headerAddImageView.frame.size.height + MARGIN;;
    [self.headerBottomBoarderView setFrame:CGRectMake(offsetX, offsetY, 1, 13)];
    
    offsetY += self.headerTopBoarderView.frame.size.height  + MARGIN;
    [self.headerAddButton setFrame:self.headerView.bounds];
    
    /* ########## Body View ########## */
    offsetX = MARGIN;
    offsetY = self.headerView.frame.size.height;
    [self.bodyView setFrame:CGRectMake(offsetX, offsetY, frameWidth - (MARGIN * 2), 95 + (self.headerView.frame.size.width - 20) + 100)];
    
    /* ########## Body - location View ########## */
    offsetX = 0;
    offsetY = 0;
    [self.locationInfoView setFrame:CGRectMake(offsetX, offsetY, self.bodyView.frame.size.width, 95)];
    
    offsetX = 15;
    offsetY = 25;
    [self.locationInfoLabel setFrame:CGRectMake(offsetX, offsetY, self.locationInfoView.frame.size.width - offsetX-5, 22)];
    
    offsetY += self.locationInfoLabel.frame.size.height;
    [self.locationImage setFrame:CGRectMake(offsetX, offsetY + 3, 20, 18)];
    
    offsetX += self.locationImage.frame.size.width + MARGIN;
    [self.locationInfoSubLabel setFrame:CGRectMake(offsetX, offsetY, self.locationInfoView.frame.size.width - offsetX-5, 22)];
    
    
    /* ########## Body - content View ########## */
    offsetX = 0;
    offsetY = self.locationInfoView.frame.size.height;
    [self.contentInfoView setFrame:CGRectMake(offsetX, offsetY, self.bodyView.frame.size.width, self.bodyView.frame.size.width - 20)];
    
    [self.contentImageView setFrame:self.contentInfoView.bounds];
    [self.contentImageView setContentMode:UIViewContentModeScaleAspectFit];
    
    
    /* ########## Body - trip info View ########## */
    offsetY = self.locationInfoView.frame.size.height + self.contentInfoView.frame.size.height;
    [self.tripInfoView setFrame:CGRectMake(offsetX, offsetY, self.bodyView.frame.size.width, 110)];

    offsetY = 0;
    [self.tripInfoDateView setFrame:CGRectMake(offsetX, offsetY, self.bodyView.frame.size.width, 55)];
    
    
    offsetX = MARGIN * 3;
    offsetY = MARGIN * 3;
    [self.tripInfoDayView setFrame:CGRectMake(offsetX, offsetY, 80, 25)];
    [self.tripInfoDayLabel setFrame:self.tripInfoDayView.frame];
    
    offsetX += self.tripInfoDayView.frame.size.width + (MARGIN * 2);
    //offsetY += self.tripInfoDayLabel.frame.size.height / 3;
    [self.tripInfoDateLabel setFrame:CGRectMake(offsetX, offsetY, self.bodyView.frame.size.width - offsetX - (MARGIN * 3), self.tripInfoDayView.frame.size.height)];
    
    offsetX = MARGIN * 3;
    offsetY = self.tripInfoDateView.frame.size.height;
    [self.tripInfoDateBoarderView setFrame:CGRectMake(offsetX, offsetY, self.bodyView.frame.size.width-(offsetX*2), 1)];
    
    offsetX = 0;
    offsetY =   self.tripInfoDateView.frame.size.height + self.tripInfoDateBoarderView.frame.size.height;
    [self.tripInfoButtonView setFrame:CGRectMake(offsetX, offsetY, self.bodyView.frame.size.width, 45)];
    
    offsetX = MARGIN * 3;
    offsetY = MARGIN;
    [self.tripInfoLikeButton setFrame:CGRectMake(offsetX, offsetY, 30, 30)];
    
    offsetX += self.tripInfoLikeButton.frame.size.width + MARGIN;
    [self.tripInfoShowMapButton setFrame:CGRectMake(offsetX, offsetY, 115, 30)];
    
    offsetX = self.bodyView.frame.size.width - (self.tripInfoLikeButton.frame.size.width * 2) - (MARGIN * 3) - MARGIN;
    [self.tripInfoShareButton setFrame:CGRectMake(offsetX, offsetY, 30, 30)];
    
    offsetX += self.tripInfoShareButton.frame.size.width + MARGIN;
    [self.tripInfoWriteButton setFrame:CGRectMake(offsetX, offsetY, 30, 30)];
    
//    [self.tripInfoLikeButton setHidden:YES];
//    [self.tripInfoShowMapButton setHidden:YES];
//    [self.tripInfoShareButton setHidden:YES];
    
}

- (void)didTestClick:(UIButton *)sender {
    
    [self.delegate didClickButton:self.indexPath buttonIdentifier:sender.accessibilityIdentifier];
}

- (void)testtripInfoDateLabel {
    self.tripInfoDateLabel.text = @"test";
}

@end
