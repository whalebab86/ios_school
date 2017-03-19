//
//  NetworkCenter.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 15..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "NetworkCenter.h"

#import "DataCenter.h"

#import "MemberInfo.h"
#import "PostInfo.h"

static NSString * const _TOKENKEY   = @"Authorization";

static NSString * const _API        = @"https://fc-ios.lhy.kr/api";

static NSString * const _SIGNUP     = @"/member/signup/";
static NSString * const _LOGIN      = @"/member/login/";
static NSString * const _LOGOUT     = @"/member/logout/";
static NSString * const _USERDETAIL = @"/member/profile/";

static NSString * const _POST       = @"/post/";

static NSString * const _POSTPAGE   = @"/post/?page=";

static NSString * const _METHODPOST = @"POST";
static NSString * const _METHODGET  = @"GET";


typedef NS_ENUM(NSInteger, FCAPIServer) {
    FCAPIServerMemberSignin,
    FCAPIServerMemberLogin,
    FCAPIServerMemberLogout,
    FCAPIServerMemberDetail,
    FCAPIServerPostList,
    FCAPIServerPostDetail,
    FCAPIServerPostCreate
};

@interface NetworkCenter ()

@property NSString *pk;
@property NSString *pageNo;

@end

@implementation NetworkCenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

-(NSMutableURLRequest *)connectionRequestInfo:(FCAPIServer)apiInfo {
    
    NSString *requestURL = @"";
    
    NSString *pkStr = [NSString stringWithFormat:@"%@/", self.pk];
    NSString *pageStr = [_POSTPAGE stringByAppendingString:self.pageNo];
    
    switch (apiInfo) {
        case 0:
            /* 회원가입 */
            requestURL = [_API stringByAppendingString:_SIGNUP];
            break;
            
        case 1:
            /* 로그인 */
            requestURL = [_API stringByAppendingString:_LOGIN];
            break;
            
        case 2:
            /* 로그아웃 */
            requestURL = [_API stringByAppendingString:_LOGOUT];
            break;
        
        case 3:
            /* 유저상세정보 */
            requestURL = [_API stringByAppendingString:_USERDETAIL];
            break;
        
        case 4:
            /* 글 목록 */
            requestURL = [_API stringByAppendingString:pageStr];
            break;
        
        case 5:
            /* 글 상세정보 */
            requestURL = [[_API stringByAppendingString:_POST] stringByAppendingString:pkStr];
            break;
        
        case 6:
            /* 글 작성 */
            requestURL = [_API stringByAppendingString:_POST];
            break;
            
        default:
            break;
    }
    
    NSURL *url = [NSURL URLWithString:requestURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    return request;
}

- (void)memberLogin:(MemberInfo *)info completionBlock:(CompetionBlock)block {
    
    NSMutableURLRequest *request = [self connectionRequestInfo:FCAPIServerMemberLogin];
    
    NSString *data = [NSString stringWithFormat:@"username=%@&password=%@",info.username, info.password];
    
    request.HTTPBody   = [data dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = _METHODPOST;
    
    NSURLSessionDataTask *dataTask = [self.session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        
        if(error != nil) {
            
            NSLog(@"ERROR : %@", error);
        } else {
            
            if(statusCode == 200) {
                
                [[DataCenter sharedInstance] saveUserTokenInfo:[dic objectForKey:@"key"]];
                [self memberUserDetail:block];
//                block(YES, dic);
                
            } else if(statusCode == 400) {
                
                block(NO, dic);
            }
        }
    }];
    
    [dataTask resume];
}


- (void)memberSignup:(MemberInfo *)info completionBlock:(CompetionBlock)block {
    
    NSMutableURLRequest *request = [self connectionRequestInfo:FCAPIServerMemberSignin];
    
    NSString *userInfo = [NSString stringWithFormat:@"username=%@&password1=%@&password2=%@", info.username, info.password, info.passwordCheck];
    
    request.HTTPBody   = [userInfo dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = _METHODPOST;
    
    NSURLSessionDataTask *dataTask = [self.session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        
        if(error != nil) {
            
            NSLog(@"ERROR : %@", error);
        } else {
            if(statusCode == 201) {
                
                [[DataCenter sharedInstance] saveUserTokenInfo:[dic objectForKey:@"key"]];
//                [self memberUserDetail:block];
                block(YES, dic);
            } else if(statusCode == 400) {
                
                block(NO, dic);
            }
        }
    }];
    
    [dataTask resume];
}

- (void)memberLogout:(CompetionBlock)block {
    
    NSMutableURLRequest *request = [self connectionRequestInfo:FCAPIServerMemberLogout];
    
    NSString *userToken = [[DataCenter sharedInstance] loadRequestToken];
    
    [request setValue:userToken forHTTPHeaderField:_TOKENKEY];
    
    request.HTTPBody   = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = _METHODPOST;
    
    NSURLSessionDataTask *dataTask = [self.session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error != nil) {
            
            NSLog(@"ERROR : %@", error);
        } else {
            
            NSDictionary *dic    = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
            
            if(statusCode == 200) {
                
                [[DataCenter sharedInstance] saveUserTokenInfo:nil];
                [DataCenter sharedInstance].userInfo = nil;
                
                block(YES, dic);
            } else if(statusCode == 401) {
                
                [[DataCenter sharedInstance] saveUserTokenInfo:nil];
                [DataCenter sharedInstance].userInfo = nil;
                
                block(NO, dic);
            }
        }
    }];
    
    [dataTask resume];
}

- (void)memberUserDetail:(CompetionBlock)block {
    
    NSMutableURLRequest *request = [self connectionRequestInfo:FCAPIServerMemberDetail];
    
    NSString *userToken = [[DataCenter sharedInstance] loadRequestToken];
    
    [request setValue:userToken forHTTPHeaderField:_TOKENKEY];
    
    request.HTTPBody   = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = _METHODGET;
    
    NSURLSessionDataTask *dataTask = [self.session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error != nil) {
            
            NSLog(@"ERROR : %@", error);
        } else {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
            
            if(statusCode == 200) {
                [DataCenter sharedInstance].userInfo = [[MemberInfo alloc] initWithUserInfo:dic];
                
                NSLog(@"%@", [DataCenter sharedInstance].userInfo);
                
                block(YES, dic);
            } else if(statusCode == 401) {
                
                block(NO, dic);
            } else {
                
                block(NO, dic);
            }
        }
    }];
    
    [dataTask resume];
    
}

- (void)PostCreate:(PostInfo *)info completionBlock:(CompetionBlock)block {
    
    NSMutableURLRequest *request = [self connectionRequestInfo:FCAPIServerPostCreate];
    
    request.HTTPMethod = @"POST";
    
    [request setValue:[[DataCenter sharedInstance] loadRequestToken] forHTTPHeaderField:_TOKENKEY];
    
    /****************************Multipart Data**************************/
    NSString *boundary = @"------------0x0x0x0x0x0x0x0x";
    NSMutableData *body = [NSMutableData data];
    //start boundary
    ///////////타이틀 정보
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"title\"\r\n\r\n%@", info.title] dataUsingEncoding:NSUTF8StringEncoding]];
    //    [body appendData:[[NSString stringWithFormat:@"%@",title] dataUsingEncoding:NSUTF8StringEncoding]];
    
    ///////////컨텐츠  정보
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"content\"\r\n\r\n%@", info.content] dataUsingEncoding:NSUTF8StringEncoding]];
    ///////////이미지 정보
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"img_cover\"; filename=\"image.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:info.img_data];
    
    //End boundary
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    /****************************Multipart Data End**************************/
    
    //bady에 셋팅
    request.HTTPBody = body;
    NSString* MultiPartContentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:MultiPartContentType forHTTPHeaderField: @"Content-Type"];
    
    NSURLSessionDataTask *dataTask = [self.session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error != nil) {
            
            NSLog(@"ERROR : %@", error);
        } else {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
            
            if(statusCode == 201) {
                
                NSArray *array = [dic objectForKey:@"results"];
                
                for (NSDictionary *dic in array) {
                    PostInfo *info = [[PostInfo alloc] initWithPostInfo:dic];
                    
                    [[DataCenter sharedInstance].postInfo addObject:info];
                }
                
                block(YES, dic);
            } else {
                
                block(NO, dic);
            }
        }
    }];
    
    [dataTask resume];
}

- (void)PostList:(NSString*)pageNumber competionBlock:(CompetionBlock)block {
    
    self.pageNo = pageNumber;
    
    NSMutableURLRequest *request = [self connectionRequestInfo:FCAPIServerPostList];
    
    NSString *userToken = [[DataCenter sharedInstance] loadRequestToken];
    [request setValue:userToken forHTTPHeaderField:_TOKENKEY];
    
    request.HTTPBody   = [@"" dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = _METHODGET;
    
    NSURLSessionDataTask *dataTask = [self.session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error != nil) {
            
            NSLog(@"ERROR : %@", error);
        } else {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
            
            if(statusCode == 200) {
                
                NSArray *array = [dic objectForKey:@"results"];

                for (NSDictionary *dic in array) {
                    PostInfo *info = [[PostInfo alloc] initWithPostInfo:dic];
                    [[DataCenter sharedInstance].postInfo addObject:info];
                }
                
                block(YES, dic);
            } else {
                
                block(NO, dic);
            }
        }
    }];
    
    [dataTask resume];
    
}

- (void)PostRetrieve:(NSString *)pk completionBlock:(CompetionBlock)block {
    
    self.pk = pk;
    NSMutableURLRequest *request = [self connectionRequestInfo:FCAPIServerPostDetail];
    
    NSString *param = [NSString stringWithFormat:@"pk=%@", pk];
    request.HTTPBody   = [param dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = _METHODGET;
    
    NSURLSessionDataTask *dataTask = [self.session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error != nil) {
            
            NSLog(@"ERROR : %@", error);
        } else {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
            
            if(statusCode == 200) {
                
                block(YES, dic);
            } else {
                
                block(NO, dic);
            }
        }
    }];
    
    [dataTask resume];
}
@end
