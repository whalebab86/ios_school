//
//  PostCustomTableViewCell.h
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 17..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *postCellView;

@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postContentLabel;

@property (nonatomic) NSString *pk;

@end
