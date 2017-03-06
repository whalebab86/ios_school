//
//  DataCenter.h
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 23..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface DataCenter : NSObject

@property (nonatomic, readonly) NSArray *resultArray;

@property (nonatomic, readonly) NSString *userId;
@property (nonatomic, readonly) NSString *userPw;

@property (nonatomic, readonly) BOOL isSwitchPrivate;
@property (nonatomic, readonly) BOOL isSwitchSync;
@property (nonatomic, readonly) NSString *distanceUnits;
@property (nonatomic, readonly) NSString *temperature;

@property (nonatomic, readonly) NSString *firstName;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) NSString *tripTitle;

@property (nonatomic, readonly) NSData   *profileImage;
@property (nonatomic, readonly) NSData   *desctiprionImage;

+ (instancetype)sharedInstance;

- (void)settingUserId:(NSString *)userId;

- (void)settingIsSwitchPrivate:(BOOL)isSwitchPrivate;
- (void)settingDistanceUnits:(NSString *)distanceUnits;
- (void)settingTemperature:(NSString *)temperature;
- (void)settingIsSwitchSync:(BOOL)isSwitchSync;

- (void)settingFirstName:(NSString *)firstName;
- (void)settingLastName:(NSString *)lastName;
- (void)settingTripTitle:(NSString *)tripTitle;
- (void)settingProfileImage:(NSData *)imageData;
- (void)settingDescriptionImage:(NSData *)imageData;


- (void)fetchItems;
- (void)saveTripInfo:(NSDictionary *)tripInfo;
- (void)updateTripInfo:(NSDictionary *)tripInfo;
- (void)deleteTripInfo:(NSString *)tripIndex;

@end
