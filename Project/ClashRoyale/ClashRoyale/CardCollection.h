//
//  CardCollection.h
//  ClashLoyal
//
//  Created by CLAY on 2017. 2. 4..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CardCollection : UIWindow

@property NSArray *nomalCardArry;
@property NSArray *rareCardArry;
@property NSArray *epicCardArry;
@property NSArray *legendaryCardArry;

- (instancetype) initWithCardInfo;
- (UIButton *)drawCashAreaWithImageName:(NSString *)imageName;

@end
