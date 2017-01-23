//
//  Man.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "Man.h"
#import "Bank.h"

@implementation Man

- (void)insertAssetWitnBank:(Bank *)bank withAssetInfo:(NSInteger)asset {
    
    self.asset += asset;
    
    NSLog(@"%@가 %@은행에  %lu를 입금하였습니다.", self.name, bank.bankName, asset);
    
    [super seleftAssetInfo:bank];
    
}

- (void)makeCardWithBankInfo: (Bank*) bank {
    NSLog(@"%@가 %@은행에서 카드를 만들었습니다.", self.name, bank.bankName);
}

@end
