//
//  Bank.h
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
@class People;

@interface Bank : NSObject

@property NSString *bankName;
@property NSString *bankLocation;

- (void)updateBankLocation: (NSString*) bankLocation;
- (void)updateAssetInfo:(NSInteger)assetInfo withFrom: (People *) fromPeople withTo: (People *) toPeople;

@end
