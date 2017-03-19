//
//  DataCenter.h
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 15..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MemberInfo.h"
#import "PostInfo.h"

typedef void (^CompetionBlock) (BOOL isSuccess, NSObject * result);

@interface DataCenter : NSObject

@property NSString         *userToken;

@property MemberInfo       *userInfo;
@property NSMutableArray   *postInfo;

+(instancetype)sharedInstance;

- (void)memberSignup:(MemberInfo *)info completionBlock:(CompetionBlock)block;
- (void)memberLogin:(MemberInfo *)info completionBlock:(CompetionBlock)block;
- (void)memberLogout:(CompetionBlock)block;

- (void)PostCreate:(PostInfo *)info completionBlock:(CompetionBlock)block;
- (void)PostList:(NSString*)pageNumber competionBlock:(CompetionBlock)block;
- (void)PostRetrieve:(NSString*)pk competionBlock:(CompetionBlock)block;

- (void)saveUserTokenInfo:(NSString *)userID;
- (NSString *)loadRequestToken;

@end
