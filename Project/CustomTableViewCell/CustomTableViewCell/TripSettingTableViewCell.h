//
//  TripSettingTableViewCell.h
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 22..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TripSettingTableViewCellDelegate;

@interface TripSettingTableViewCell : UITableViewCell

@property (nonatomic, weak) UILabel   *settingTitle;
@property (nonatomic, weak) UISwitch  *settingSwitch;
@property (nonatomic, weak) UILabel   *settingLabel;
@property (nonatomic)       NSIndexPath *indexPath;

@property (nonatomic, weak) id<TripSettingTableViewCellDelegate> delegate;

- (void)accessoryViewWithCell:(TripSettingTableViewCell *)cell value:(NSDictionary *) array;


@end

@protocol TripSettingTableViewCellDelegate <NSObject>

- (void)settingCustomCell:(TripSettingTableViewCell *)cell didChangedValue:(BOOL)value;

@end
