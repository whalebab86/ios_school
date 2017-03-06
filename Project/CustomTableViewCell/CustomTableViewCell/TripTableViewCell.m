//
//  CustomTableViewCell.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 17..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "TripTableViewCell.h"

@interface TripTableViewCell ()

@property (nonatomic, weak) UIView      *addSubView;

@property (nonatomic, weak) UIView      *titleView;
@property (nonatomic, weak) UIImageView *titleImageView;
@property (nonatomic, weak) UILabel     *titleMainTitleLabel;
@property (nonatomic, weak) UILabel     *titleSubTitleLabel;

@property (nonatomic, weak) UIImageView *contentImageView;
@property (nonatomic, weak) UILabel     *contentMainTitleLabel;
@property (nonatomic, weak) UILabel     *contentDateLabel;
@property (nonatomic, weak) UILabel     *contentDateCaptionLabel;
@property (nonatomic, weak) UILabel     *contentDaysLabel;
@property (nonatomic, weak) UILabel     *contentDaysCaptionLabel;
@property (nonatomic, weak) UILabel     *contentKmLabel;
@property (nonatomic, weak) UILabel     *contentKmCaptionLabel;
@property (nonatomic, weak) UILabel     *contentStepsLabel;
@property (nonatomic, weak) UILabel     *contentStepsCaptionLabel;

@property (nonatomic, weak) UIView      *footerView;
@property (nonatomic, weak) UILabel     *footerMainTitleLabel;

@end

@implementation TripTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/* 초기화 메소드 재정의 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        /* View Draw */
        [self customCellSubView];
        
        /* View Frame Setting */
        [self settingCustomCellFrame];
        
        /* View Background Setting */
        [self settingCustomCellBackgroundColor];
    }
    
    return self;
}

/* */
-(void)layoutSubviews {
    
    [self settingCustomCellFrame];
}


- (void)customCellSubView {
    
    UIView *addSubView = [[UIView alloc] init];
    self.addSubView = addSubView;
    [self.contentView addSubview:addSubView];
    
    /* ########## Title Area : Start ########## */
    UIView *titleView = [[UIView alloc] init];
    
    self.titleView = titleView;
    [addSubView addSubview:titleView];
    
    /* Title Image View */
    UIImageView *titleImageView = [[UIImageView alloc] init];
    self.titleImageView = titleImageView;
    [titleView addSubview:titleImageView];
    
    /* Title Main Label */
    UILabel *titleMainLabel = [[UILabel alloc] init];
    [titleMainLabel setFont:[UIFont boldSystemFontOfSize:18]];
    
    /* Title Title Label */
    self.titleMainTitleLabel = titleMainLabel;
    [self.titleView addSubview:titleMainLabel];
    
    /* 상단 서브 타이틀 라벨 */
    UILabel *titleSubTitleLabel = [[UILabel alloc] init];
    [titleSubTitleLabel setFont:[UIFont systemFontOfSize:15]];
    
    self.titleSubTitleLabel = titleSubTitleLabel;
    [self.titleView addSubview:titleSubTitleLabel];
    /* ########## Title Area : End ########## */
    
    
    /* ########## Content Area : Start ########## */
    UIImageView *contentImageView = [[UIImageView alloc] init];
    //[contentImageView setContentMode:UIViewContentModeScaleAspectFit];
    self.contentImageView = contentImageView;
    [addSubView addSubview:contentImageView];
    
    /* Content Main Title */
    UILabel *contentMainTitleLabel  = [[UILabel alloc] init];
    [contentMainTitleLabel setFont:[UIFont boldSystemFontOfSize:30]];
    [contentMainTitleLabel setTextColor:[UIColor whiteColor]];
    self.contentMainTitleLabel      = contentMainTitleLabel;
    [self.contentImageView addSubview:contentMainTitleLabel];
    
    
    UILabel *contentDateLabel = [[UILabel alloc] init];
    [contentDateLabel setTextColor:[UIColor whiteColor]];
    [contentDateLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [self.contentImageView addSubview:contentDateLabel];
    self.contentDateLabel = contentDateLabel;
    
    UILabel *contentDateCaptionLabel = [[UILabel alloc] init];
    [contentDateCaptionLabel setTextColor:[UIColor lightGrayColor]];
    [contentDateCaptionLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [self.contentImageView addSubview:contentDateCaptionLabel];
    self.contentDateCaptionLabel = contentDateCaptionLabel;
    
    
    UILabel *contentDaysLabel = [[UILabel alloc] init];
    [contentDaysLabel setTextColor:[UIColor whiteColor]];
    [contentDaysLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [self.contentImageView addSubview:contentDaysLabel];
    self.contentDaysLabel = contentDaysLabel;
    
    UILabel *contentDaysCaptionLabel = [[UILabel alloc] init];
    [contentDaysCaptionLabel setTextColor:[UIColor lightGrayColor]];
    [contentDaysCaptionLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [self.contentImageView addSubview:contentDaysCaptionLabel];
    self.contentDaysCaptionLabel = contentDaysCaptionLabel;
    
    
    UILabel *contentKmLabel = [[UILabel alloc] init];
    [contentKmLabel setTextColor:[UIColor whiteColor]];
    [contentKmLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [self.contentImageView addSubview:contentKmLabel];
    self.contentKmLabel = contentKmLabel;
    
    UILabel *contentKmCaptionLabel = [[UILabel alloc] init];
    [contentKmCaptionLabel setTextColor:[UIColor lightGrayColor]];
    [contentKmCaptionLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [self.contentImageView addSubview:contentKmCaptionLabel];
    self.contentKmCaptionLabel = contentKmCaptionLabel;
    
    UILabel *contentStepsLabel = [[UILabel alloc] init];
    [contentStepsLabel setTextColor:[UIColor whiteColor]];
    [contentStepsLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [self.contentImageView addSubview:contentStepsLabel];
    self.contentStepsLabel = contentStepsLabel;
    
    UILabel *contentStepsCaptionLabel = [[UILabel alloc] init];
    [contentStepsCaptionLabel setTextColor:[UIColor lightGrayColor]];
    [contentStepsCaptionLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [self.contentImageView addSubview:contentStepsCaptionLabel];
    self.contentStepsCaptionLabel = contentStepsCaptionLabel;
    
    /* ########## Content Area : End ########## */
    
    
    /* ########## Footer Area : Start ########## */
    UIView *footerView = [[UIView alloc] init];
    
    self.footerView = footerView;
    [addSubView addSubview:footerView];
    
    /* Footer Main Title */
    UILabel *footerMainTitleLabel = [[UILabel alloc] init];
    [footerMainTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [footerMainTitleLabel setNumberOfLines:0];
    [footerMainTitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [footerMainTitleLabel setTextColor:[UIColor lightGrayColor]];
    [footerMainTitleLabel setFont:[UIFont systemFontOfSize:14]];
    
    self.footerMainTitleLabel = footerMainTitleLabel;
    [self.footerView addSubview:footerMainTitleLabel];
    /* ########## Footer Area : End ########## */
    
    /* Label setText */
    self.titleMainTitleLabel.text = @"Custom Table View Cell";
    self.titleSubTitleLabel.text  = @"Sub Title";
    
    self.contentMainTitleLabel.text = @"Mission\nMadagascar";
    [self.contentMainTitleLabel setNumberOfLines:0];
    
    [self.titleImageView setImage:[UIImage imageNamed:@"profile"]];
    [self.contentImageView setImage:[UIImage imageNamed:@"madagascar.jpeg"]];
    
    [self.footerMainTitleLabel setText:@"Work and pleasure combined on the most beatuful island in the world!"];
    
    self.contentDateLabel.text         = @"2016";
    self.contentDateCaptionLabel.text  = @"june";
    self.contentDaysLabel.text         = @"67";
    self.contentDaysCaptionLabel.text  = @"Days";
    self.contentKmLabel.text           = @"23,746";
    self.contentKmCaptionLabel.text    = @"Kilometer";
    self.contentStepsLabel.text        = @"46";
    self.contentStepsCaptionLabel.text = @"Steps";
}


- (void)settingCustomCellFrame {
    
    const CGFloat MARGIN = 5;
    
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    
    offsetX += MARGIN;
    offsetY += MARGIN;
    
    self.addSubView.frame = CGRectMake(offsetX, offsetY, self.frame.size.width-(MARGIN*2), self.frame.size.height-(MARGIN*2) + 10);
    //[self.addSubView setClipsToBounds:YES];
    
    /* ########## Title Area : Start ########## */
    
    /* 상단 View Frame */
    self.titleView.frame = CGRectMake(offsetX, offsetY, self.addSubView.frame.size.width - (MARGIN * 2), 70);

    offsetX += MARGIN*2;
    offsetY += MARGIN*2;
    
    /* 상단 View ImageView Frame */
    self.titleImageView.frame = CGRectMake(offsetX, offsetY, self.titleView.frame.size.height-(MARGIN * 5), self.titleView.frame.size.height-(MARGIN * 5));
    [self.titleImageView.layer setCornerRadius:(self.titleView.frame.size.height-(MARGIN * 5)) / 2];
    [self.titleImageView setClipsToBounds:YES];
    
    offsetX += self.titleView.frame.size.height-(MARGIN * 4) + MARGIN;
    offsetY = MARGIN*2;
    
    /* 상단 View MainTitle Frame */
    self.titleMainTitleLabel.frame = CGRectMake(offsetX, offsetY, self.titleView.frame.size.width - offsetX - MARGIN, (self.titleView.frame.size.height-(MARGIN * 2)) / 2);
    
    offsetY += (self.titleView.frame.size.height-(MARGIN * 2)) / 3;
    
    /* 상단 View SubTitle Frame */
    self.titleSubTitleLabel.frame = CGRectMake(offsetX, offsetY, self.titleView.frame.size.width - offsetX - MARGIN, (self.titleView.frame.size.height-((MARGIN * 2))) / 2);
    
    offsetX = MARGIN;
    offsetY = MARGIN + self.titleView.frame.size.height;
    /* ########## Title Area : End ########## */
    
    
    /* ########## Content Area : Start ########## */
    self.contentImageView.frame = CGRectMake(offsetX, offsetY, self.addSubView.frame.size.width - (MARGIN * 2), 200);
    
    NSInteger labelWidth  = (self.contentImageView.frame.size.width - ((MARGIN*5) * 5)) / 4;
    NSInteger labelHeight = 15;
    
    offsetX = MARGIN*5;
    offsetY = (self.contentImageView.frame.size.height / 2) - 50;
    
    self.contentMainTitleLabel.frame = CGRectMake(offsetX, offsetY, self.contentImageView.frame.size.width - (MARGIN * 6), 80);

    /* Content ImageView 하위 Title */
    offsetX = MARGIN*5;
    offsetY = self.contentImageView.frame.size.height - (labelHeight * 3);
    
    self.contentDateLabel.frame = CGRectMake(offsetX, offsetY, labelWidth, labelHeight);
    
    offsetX += labelWidth + (MARGIN*5);
    
    self.contentDaysLabel.frame = CGRectMake(offsetX, offsetY, labelWidth, labelHeight);
    
    offsetX += labelWidth + (MARGIN*5);
    
    self.contentKmLabel.frame = CGRectMake(offsetX, offsetY, labelWidth, labelHeight);
    
    offsetX += labelWidth + (MARGIN*5);
    
    self.contentStepsLabel.frame = CGRectMake(offsetX, offsetY, labelWidth, labelHeight);
    
    
    offsetX = (MARGIN*5);
    offsetY = self.contentImageView.frame.size.height - (labelHeight * 2);
    
    self.contentDateCaptionLabel.frame = CGRectMake(offsetX, offsetY, labelWidth, labelHeight);
    
    offsetX += labelWidth + (MARGIN*5);
    
    self.contentDaysCaptionLabel.frame = CGRectMake(offsetX, offsetY, labelWidth, labelHeight);
    
    offsetX += labelWidth + (MARGIN*5);
    
    self.contentKmCaptionLabel.frame = CGRectMake(offsetX, offsetY, labelWidth, labelHeight);
    
    offsetX += labelWidth + (MARGIN*5);
    
    self.contentStepsCaptionLabel.frame = CGRectMake(offsetX, offsetY, labelWidth, labelHeight);
    /* ########## Content Area : End ########## */
    
    offsetX = MARGIN;
    offsetY = MARGIN + self.titleView.frame.size.height + self.contentImageView.frame.size.height;
    
    /* ########## Footer Area : Start ########## */
    self.footerView.frame = CGRectMake(offsetX, offsetY, self.addSubView.frame.size.width - (MARGIN * 2), 70);
    
    self.footerMainTitleLabel.frame = CGRectMake(MARGIN*2, 0, self.footerView.frame.size.width - (MARGIN * 4), 70);
    /* ########## Footer Area : End ########## */
     
}

- (void)settingCustomCellBackgroundColor {

    [self.titleView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView setBackgroundColor:[UIColor colorWithRed:233/255.0 green:234/255.0 blue:236/255.0 alpha:1]];
    [self.footerView setBackgroundColor:[UIColor whiteColor]];
    
}

@end
