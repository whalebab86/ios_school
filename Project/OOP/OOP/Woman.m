//
//  Woman.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "Woman.h"
#import "Bank.h"

@implementation Woman

- (void) clearAssetInfoWithBankInfo: (Bank *)bank {
    NSLog(@"%@가 %@은행에서 통장정리를 하였습니다.", self.name, bank.bankName);
}

@end
