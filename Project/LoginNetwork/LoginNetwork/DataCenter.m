//
//  DataCenter.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 15..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "DataCenter.h"
#import "NetworkCenter.h"

@interface DataCenter ()

@property NetworkCenter *network;

@end

@implementation DataCenter

+(instancetype)sharedInstance {
    
    static DataCenter *center = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[DataCenter alloc] init];
    });
    
    return center;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        self.postInfo  = [[NSMutableArray alloc] init];
        self.network   = [[NetworkCenter alloc] init];
        [self loadUserTokenInfo];
    }
    
    return self;
}

- (void)loadUserTokenInfo {
    
    self.userToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"userToken"];
}

- (NSString *)loadRequestToken {
    
    return [@"Token " stringByAppendingString:self.userToken];
}

- (void)saveUserTokenInfo:(NSString *)userToken {
    
    self.userToken = userToken;
    [[NSUserDefaults standardUserDefaults] setObject:userToken forKey:@"userToken"];
}

- (void)memberLogin:(MemberInfo *)info completionBlock:(CompetionBlock)block {
    
    [self.network memberLogin:info completionBlock:block];
    
}

- (void)memberSignup:(MemberInfo *)info completionBlock:(CompetionBlock)block {
    
    [self.network memberSignup:info completionBlock:block];
}

- (void)memberLogout:(CompetionBlock)block {
    
    [self.network memberLogout:block];
}

//- (void)memberUserDetail {
//    
//}

- (void)PostCreate:(PostInfo *)info completionBlock:(CompetionBlock)block {
    [self.network PostCreate:info completionBlock:block];
}

- (void)PostList:(NSString*)pageNumber competionBlock:(CompetionBlock)block {
    
    [self.network PostList:pageNumber competionBlock:block];
}

- (void)PostRetrieve:(NSString*)pk competionBlock:(CompetionBlock)block {
    
    [self.network PostRetrieve:pk completionBlock:block];
}

@end
