//
//  TripCustomTableViewCell.h
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 25..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TripCustomTableViewCellDelegate <NSObject>

-(void)didClickButton:(NSIndexPath *)indexPath buttonIdentifier:(NSString *)buttonIdentifier;

@end


@interface TripCustomTableViewCell : UITableViewCell

@property (nonatomic) NSIndexPath *indexPath;
@property (nonatomic, assign) id<TripCustomTableViewCellDelegate> delegate;

@property (nonatomic, weak) UILabel     *locationInfoLabel;
@property (nonatomic, weak) UIImageView *locationImage;
@property (nonatomic, weak) UILabel     *locationInfoSubLabel;
@property (nonatomic, weak) UIImageView *contentImageView;
@property (nonatomic, weak) UILabel     *tripInfoDayLabel;
@property (nonatomic, weak) UILabel     *tripInfoDateLabel;


- (void)testtripInfoDateLabel;

@end
