//
//  UserInfo.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 16..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "MemberInfo.h"

@implementation MemberInfo

- (instancetype)initWithUserInfo:(NSDictionary *)userInfo
{
    self = [super init];
    if (self) {
        self.username   = [userInfo objectForKey:@"username"];
        self.first_name = [userInfo objectForKey:@"first_name"];
        self.last_name  = [userInfo objectForKey:@"last_name"];
        self.email      = [userInfo objectForKey:@"email"];
    }
    return self;
}

@end
