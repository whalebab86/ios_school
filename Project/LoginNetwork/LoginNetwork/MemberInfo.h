//
//  UserInfo.h
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 16..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberInfo : NSObject

@property NSString *username;
@property NSString *password;
@property NSString *passwordCheck;
@property NSString *first_name;
@property NSString *last_name;
@property NSString *email;

- (instancetype)initWithUserInfo:(NSDictionary *)userInfo;

@end
