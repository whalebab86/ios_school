//
//  CardUnitInfo.m
//  clashRoyale
//
//  Created by CLAY on 2017. 2. 5..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "CardUnitInfo.h"

@implementation CardUnitInfo

- (instancetype)initWithGrade:(NSString *) grade {
    self = [super init];
    
    if(self) {
        
        if( [grade isEqualToString:@"c"]) self.unitGradeLabel = @"Common";
        if( [grade isEqualToString:@"r"]) self.unitGradeLabel = @"Rare";
        if( [grade isEqualToString:@"e"]) self.unitGradeLabel = @"Epic";
        if( [grade isEqualToString:@"l"]) self.unitGradeLabel = @"Legendary";
        
        if( [grade isEqualToString:@"c"]) self.unitGradeColor = [UIColor whiteColor];
        if( [grade isEqualToString:@"r"]) self.unitGradeColor = [UIColor blueColor];
        if( [grade isEqualToString:@"e"]) self.unitGradeColor = [UIColor purpleColor];
        if( [grade isEqualToString:@"l"]) self.unitGradeColor = [UIColor yellowColor];
        
        if( [grade isEqualToString:@"c"]) self.maxCount = 100;
        if( [grade isEqualToString:@"r"]) self.maxCount = 50;
        if( [grade isEqualToString:@"e"]) self.maxCount = 10;
        if( [grade isEqualToString:@"l"]) self.maxCount = 5;
        
        if( [grade isEqualToString:@"c"]) self.unitGradePrice = 20;
        if( [grade isEqualToString:@"r"]) self.unitGradePrice = 200;
        if( [grade isEqualToString:@"e"]) self.unitGradePrice = 2000;
        if( [grade isEqualToString:@"l"]) self.unitGradePrice = 20000;
        
        self.unitCount = 0;
    }
    
    return self;
}

- (UIView *)drawUnitAreaWidhGrade:(NSString *) grade unitName:(NSString *)name {
    
    NSInteger offsetX = 0;
    NSInteger offsetY = 5;
    
    // Main View
    UIView * unitView = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, 115, 215)];
    
    unitView.layer.cornerRadius = 5;
    unitView.layer.masksToBounds = YES;
    unitView.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:0.5];
    unitView.layer.borderColor = [UIColor blackColor].CGColor;
    unitView.layer.borderWidth = 2;
    offsetX += 5;
    
    // 색상 레이어 View
    UIView * unitMakeView = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, 105, 205)];
    unitMakeView.layer.cornerRadius = 5;
    unitMakeView.layer.masksToBounds = YES;
    unitMakeView.backgroundColor = [UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1];
    [unitView addSubview:unitMakeView];
    offsetX += 5;
    offsetY += 5;
    
    // 카드 이름 Label
    UILabel *unitName = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, offsetY, 90, 15)];
    unitName.text = name;
    unitName.font = [UIFont boldSystemFontOfSize:13];
    unitName.textAlignment = NSTextAlignmentCenter;
    [unitView addSubview:unitName];
    offsetY += 15;
    
    // 카드 등급 Label
    UILabel *unitGrade = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, offsetY, 90, 15)];
    
    unitGrade.text      = self.unitGradeLabel;
    unitGrade.textColor = self.unitGradeColor;
    
    unitGrade.font = [UIFont boldSystemFontOfSize:12];
    unitGrade.textAlignment = NSTextAlignmentCenter;
    [unitView addSubview:unitGrade];
    offsetY += 15;
    
    // 카드 이미지 Button
    self.unitImage = [UIButton buttonWithType:UIButtonTypeCustom];
    self.unitImage.frame = CGRectMake(offsetX, offsetY, 95, 120);
    [self.unitImage setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"image/Unit/%@_%@.png",grade, name]] forState:(UIControlStateNormal)];
    [self.unitImage setAccessibilityIdentifier:[NSString stringWithFormat:@"%@_%@", grade, name]];
    [unitView addSubview:self.unitImage];
    offsetX += 5;
    offsetY += 125;
    
    // 카드수 Label
    self.unitCount = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, offsetY, 90, 15)];
    self.unitCount.text = [NSString stringWithFormat:@"%ld/%ld", self.currentCount, self.maxCount];
    self.unitCount.font = [UIFont boldSystemFontOfSize:11];
    self.unitCount.textAlignment = NSTextAlignmentCenter;
    self.unitCount.layer.borderWidth = 2;
    self.unitCount.layer.borderColor = [UIColor grayColor].CGColor;
    [unitView addSubview:self.unitCount];
    
    // 카드수 MaskView
    self.unitCountMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.unitCount.frame.size.height)];
    self.unitCountMaskView.backgroundColor = [UIColor greenColor];
    self.unitCountMaskView.alpha = 0.5;
    [self.unitCount addSubview:self.unitCountMaskView];
    
    // 화살표 이미지 ImageView
    UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX-6, offsetY-4, 20, 20)];
    arrow.image = [UIImage imageNamed:@"image/Etc/arrow.png"];
    [unitView addSubview:arrow];
    offsetY += 20;
    
    // 카드 가격 ImageView
    UIImageView *unitPriceImg = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, 20, 20)];
    unitPriceImg.image = [UIImage imageNamed:@"image/Gold/Gold.png"];
    [unitView addSubview:unitPriceImg];
    
    // 카드 가격 Label
    UILabel *unitPrice = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, offsetY, 90, 20)];
    if( [grade isEqualToString:@"c"]) unitPrice.text = @"20";
    if( [grade isEqualToString:@"r"]) unitPrice.text = @"200";
    if( [grade isEqualToString:@"e"]) unitPrice.text = @"2000";
    if( [grade isEqualToString:@"l"]) unitPrice.text = @"20000";
    unitPrice.font = [UIFont boldSystemFontOfSize:13];
    unitPrice.textAlignment = NSTextAlignmentCenter;
    
    [unitView addSubview:unitPrice];
    
    return unitView;
}
@end
