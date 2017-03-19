//
//  PostInfo.h
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 16..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostInfo : NSObject

@property NSString *pk;
@property NSString *title;
@property NSString *img_cover;
@property NSData   *img_data;
@property NSString *content;

- (instancetype)initWithPostInfo:(NSDictionary *)info;

@end
