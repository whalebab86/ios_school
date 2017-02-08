//
//  CardUnitInfo.h
//  clashRoyale
//
//  Created by CLAY on 2017. 2. 5..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CardUnitInfo : UIWindow

@property UIView   *mainView;

@property UIButton *unitImage;
@property UILabel  *unitCount;
@property UIView   *unitCountMaskView;

@property NSString  *unitGradeLabel;
@property UIColor   *unitGradeColor;
@property NSInteger unitGradeMaxCount;
@property NSInteger unitGradePrice;

@property NSInteger currentCount;
@property NSInteger maxCount;

- (instancetype)initWithGrade:(NSString *) grade;
- (UIView *)drawUnitAreaWidhGrade:(NSString *) grade unitName:(NSString *)name;

@end
