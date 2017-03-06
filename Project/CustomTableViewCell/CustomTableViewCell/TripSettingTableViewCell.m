//
//  TripSettingTableViewCell.m
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 22..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "TripSettingTableViewCell.h"
#import "DataCenter.h"

typedef NS_ENUM(NSInteger, UICustomCellType) {
    UICustomCellTypeSwitch = 1,
    UICustomCellTypeLabel = 2,
    UICustomCellTypeAccessory = 3
};

@interface TripSettingTableViewCell ()

@property (nonatomic, weak) UIView  *settingBottomView;
@property (nonatomic, weak) UIView  *settingTypeView;
@property (nonatomic, weak) UILabel *settingSeperatorLabel;

@end

@implementation TripSettingTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        /* View Draw */
        [self customCellSubView];
        
        /* View Frame Setting */
        [self settingCustomCellFrame];
    }
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return self;
}

-(void)layoutSubviews {
    [self settingCustomCellFrame];
    
}

/* View Draw */
- (void)customCellSubView {

    UIView *settingBottomViewTemp = [[UIView alloc] init];
    [self.contentView addSubview:settingBottomViewTemp];
    self.settingBottomView = settingBottomViewTemp;
    
    UILabel *settingTitleTemp = [[UILabel alloc] init];
    [settingTitleTemp setTextColor:[UIColor blackColor]];
    [settingTitleTemp setFont:[UIFont boldSystemFontOfSize:15]];
    [self.contentView addSubview:settingTitleTemp];
    self.settingTitle = settingTitleTemp;
    
    /*
    UIView *settingTypeView = [[UILabel alloc] init];
    [self.contentView addSubview:settingTypeView];
    self.settingTypeView = settingTypeView;
    */
    
    UILabel *settingSeperatorLabelTemp = [[UILabel alloc] init];
    [settingSeperatorLabelTemp setTextColor:[UIColor colorWithRed:188/255.0 green:30/255.0 blue:73/255.0 alpha:1]];
    [settingSeperatorLabelTemp setFont:[UIFont boldSystemFontOfSize:13]];
    [settingSeperatorLabelTemp setText:@">"];
    [settingSeperatorLabelTemp setTextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:settingSeperatorLabelTemp];
    self.settingSeperatorLabel = settingSeperatorLabelTemp;
    
    UILabel *settingLabelTemp = [[UILabel alloc] init];
    [settingLabelTemp setTextColor:[UIColor blackColor]];
    [settingLabelTemp setFont:[UIFont systemFontOfSize:13]];
    [settingLabelTemp setTextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:settingLabelTemp];
    self.settingLabel = settingLabelTemp;
    
    UISwitch *settingSwitchTemp = [[UISwitch alloc] init];
    [self.contentView addSubview:settingSwitchTemp];
    self.settingSwitch = settingSwitchTemp;
    
    [settingSwitchTemp addTarget:self action:@selector(switcherClick:) forControlEvents:UIControlEventValueChanged];
}

/* View Frame Setting */
- (void)settingCustomCellFrame {
    
    [self.settingBottomView setFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
    [self.settingBottomView setBackgroundColor:[UIColor lightGrayColor]];
    
    [self.settingTitle setFrame:CGRectMake(15, 0, self.frame.size.width - 80, self.frame.size.height)];
    
    [self.settingSwitch setFrame:CGRectMake(self.frame.size.width - 51 - 15, 12, 51, 31)];
    
    [self.settingSeperatorLabel setFrame:CGRectMake(self.frame.size.width - 51 - 15, 12, 51, 31)];
    
    [self.settingLabel setFrame:CGRectMake(self.frame.size.width - 150 - 35, 12, 150, 31)];
}

- (void)accessoryViewWithCell:(TripSettingTableViewCell *)cell value:(NSDictionary *) array{
    
    DataCenter *center = [DataCenter sharedInstance];
    
    NSString *title = [array objectForKey:@"title"];
    NSString *type  = [array objectForKey:@"type"];
    //NSString *value = [array objectForKey:@"value"];
    
    cell.settingTitle.text = title;
    
    [self.settingLabel          setHidden:YES];
    [self.settingSwitch         setHidden:YES];
    [self.settingSeperatorLabel setHidden:YES];
    
    if([type isEqualToString:@"S"]) {
        
        [self.settingSwitch setHidden:NO];
        
        if(cell.indexPath.section == 1 && cell.indexPath.row == 0) {
            [self.settingSwitch setOn:center.isSwitchPrivate];
        } else if(cell.indexPath.section == 2 && cell.indexPath.row == 2) {
            [self.settingSwitch setOn:center.isSwitchSync];
        }
        
    } else if([type isEqualToString:@"L"]) {
        
        [self.settingLabel setHidden:NO];
        [self.settingSeperatorLabel setHidden:NO];
        
        //[self.settingLabel setText:value];
        if(cell.indexPath.section == 2 && cell.indexPath.row == 0) {
            [self.settingLabel setText:center.distanceUnits];
        } else if(cell.indexPath.section == 2 && cell.indexPath.row == 1) {
            [self.settingLabel setText:center.temperature];
        }
        
    } else if([type isEqualToString:@"A"]) {
        
        [self.settingSeperatorLabel setHidden:NO];
    }
}

- (void)switcherClick:(UISwitch *)sender
{
    if ([self.delegate respondsToSelector:@selector(settingCustomCell:didChangedValue:)]) {
        [self.delegate settingCustomCell:self didChangedValue:sender.isOn];
    }
}
@end
