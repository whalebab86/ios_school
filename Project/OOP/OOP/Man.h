//
//  Man.h
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"

@interface Man : People

- (void)insertAssetWitnBank:(Bank *)bank withAssetInfo:(NSInteger)asset;
- (void)makeCardWithBankInfo: (Bank*) bank;

@end
