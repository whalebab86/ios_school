//
//  People.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//
#import "People.h"
#import "Bank.h"

@implementation People

- (void)insertAssetWitnBank:(Bank *)bank withAssetInfo: (NSInteger) asset {
    
    self.asset += asset;
    
    NSLog(@"%@가 %@은행에  %lu를 입금하였습니다.", self.name, bank.bankName, asset);
}

- (void)seleftAssetInfo:(Bank *)bank {
    NSLog(@"%@가 %@은행에서 계좌조회결과 %lu를 입금되어있습니다.", self.name, bank.bankName, self.asset);
}


@end
