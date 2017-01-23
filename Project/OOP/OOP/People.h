//
//  People.h
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Bank;

@interface People : NSObject

@property NSString *name;
@property NSInteger asset;

- (void)insertAssetWitnBank : (Bank*) bank withAssetInfo: (NSInteger) asset;
- (void)seleftAssetInfo : (Bank*) bank;

@end
