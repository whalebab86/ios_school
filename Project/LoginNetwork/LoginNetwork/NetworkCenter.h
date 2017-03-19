//
//  NetworkCenter.h
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 15..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MemberInfo.h"
#import "PostInfo.h"

typedef void (^CompetionBlock) (BOOL isSuccess, NSObject* result);

@interface NetworkCenter : NSObject

@property (nonatomic) NSURLSession *session;
@property (nonatomic) NSURLSessionTask *task;

- (void)memberLogin:(MemberInfo *)info completionBlock:(CompetionBlock)block;
- (void)memberSignup:(MemberInfo *)info completionBlock:(CompetionBlock)block;
- (void)memberLogout:(CompetionBlock)block;

- (void)PostCreate:(PostInfo *)info completionBlock:(CompetionBlock)block;
- (void)PostList:(NSString*)pageNumber competionBlock:(CompetionBlock)block;
- (void)PostRetrieve:(NSString *)pk completionBlock:(CompetionBlock)block;

@end
