//
//  AppDelegate.h
//  CustomTableViewCell
//
//  Created by CLAY on 2017. 2. 17..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

