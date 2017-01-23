//
//  GameCharacter.h
//  WarCraft
//
//  Created by BongKi Cho on 2017. 1. 19..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCharacter : NSObject

//@property (readonly) NSUInteger ap;

@property NSString  *name;
@property NSUInteger def;

- (instancetype)initWithName:(NSInteger) paramHp withAp:(NSInteger)paramAp withSp:(NSInteger) paramSp;

- (void)setDefaultHp: (NSInteger) paramHp withAp:(NSInteger)paramAp withSp:(NSInteger) paramSp;
- (void)jumpTo: (GameCharacter *)chracter;
- (void)pygicalAttackTarget: (GameCharacter *) attackTarget;
- (void)magicalAttackTarget: (GameCharacter *) attackTarget;

- (NSUInteger)showApInfo;

@end
