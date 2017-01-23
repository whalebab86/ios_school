//
//  GameCharacter.m
//  WarCraft
//
//  Created by BongKi Cho on 2017. 1. 19..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "GameCharacter.h"

@interface GameCharacter()

@property NSString   *nickName;
@property NSUInteger currentHp;
@property NSUInteger ap;
@property NSUInteger sp;

@end

@implementation GameCharacter

- (NSUInteger)showApInfo {
    return self.ap;
}

- (instancetype)initWithName:(NSInteger) paramHp withAp:(NSInteger)paramAp withSp:(NSInteger) paramSp {
    
    self = [super init];
    
    if(self) {
        self.currentHp = paramHp;
        self.ap = paramAp;
        self.sp = paramSp;
    }
    
    return self;
}

- (void)setDefaultHp: (NSInteger) paramHp withAp:(NSInteger)paramAp withSp:(NSInteger) paramSp {
    
    self.currentHp = paramHp;
    self.ap = paramAp;
    self.sp = paramSp;
}

- (void)pygicalAttackTarget: (GameCharacter *) attackTarget {
    
    NSLog(@"공격 전 %lu HP", attackTarget.currentHp);
    
    NSLog(@"공격!! 공격대상 : %@ / 물리 공격력 : %lu / 상대 방어력 %lu", attackTarget.name, self.ap, attackTarget.def);
    NSUInteger damage = self.ap - attackTarget.def;
    
    if(attackTarget.currentHp > damage) {
        attackTarget.currentHp -= damage;
        NSLog(@"공격 후 %lu HP / 데미지 %lu", attackTarget.currentHp, damage);
        NSLog(@"물리 공격 성공 !!!");
    } else {
        attackTarget.currentHp = 0;
        NSLog(@"HP : 0 / Die!!!");
        NSLog(@"You Win!!!");
    }
    
    NSLog(@"");
}

- (void)magicalAttackTarget: (GameCharacter *) attackTarget {
    NSLog(@"공격 전 %lu HP", attackTarget.currentHp);
    
    NSLog(@"공격!! 공격대상 : %@ / 마법 공격력 : %lu / 상대 방어력 %lu", attackTarget.name, self.sp, attackTarget.def);
    NSUInteger damage = self.sp - attackTarget.def;
    
    if(attackTarget.currentHp > damage) {
        attackTarget.currentHp -= damage;
        NSLog(@"공격 후 %lu HP / 데미지 %lu", attackTarget.currentHp, damage);
        NSLog(@"마법 공격 성공 !!!");
    } else {
        attackTarget.currentHp = 0;
        NSLog(@"HP : 0 / Die!!!");
        NSLog(@"You Win!!!");
    }
    
    
    NSLog(@"");
}

-(void)jumpTo:(GameCharacter *)chracter {
    
    NSLog(@"Jump %@", self.name);
}

- (NSString *)description {
    
    NSString *resultMSG = [NSString stringWithFormat:@"%lu, %lu, %lu", self.currentHp, self.ap, self.sp];
    
    NSLog(@"test");
    
    return resultMSG;
}

@end
