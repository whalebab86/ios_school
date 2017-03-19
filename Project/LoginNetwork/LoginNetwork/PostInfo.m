//
//  PostInfo.m
//  LoginNetwork
//
//  Created by CLAY on 2017. 3. 16..
//  Copyright © 2017년 whalebab. All rights reserved.
//

#import "PostInfo.h"

@implementation PostInfo

- (instancetype)initWithPostInfo:(NSDictionary *)info
{
    self = [super init];
    if (self) {
        
        self.pk        = [info objectForKey:@"pk"];
        self.title     = [info objectForKey:@"title"];
        self.content   = [info objectForKey:@"content"];
        self.img_cover = [info objectForKey:@"img_cover"];
        
    }
    return self;
}

@end
