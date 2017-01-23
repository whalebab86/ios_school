//
//  Bank.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "Bank.h"
#import "People.h"

@implementation Bank

-(void)updateBankLocation:(NSString *)bankLocation {
    
    NSLog(@"%@은행이 %@에서 %@로 주소를 변경하였습니다.", self.bankName, self.bankLocation, bankLocation);
    
    self.bankLocation = bankLocation;
}

- (void)updateAssetInfo:(NSInteger)assetInfo withFrom: (People *) fromPeople withTo: (People *) toPeople{
    
    fromPeople.asset -= assetInfo;
    toPeople.asset   += assetInfo;
    
    NSLog(@"%@가 %@에게 %lu를 이체하였습니다.", fromPeople.name, toPeople.name, assetInfo);
}
    
@end
