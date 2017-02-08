//
//  CardCollection.m
//  ClashLoyal
//
//  Created by CLAY on 2017. 2. 4..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "CardCollection.h"

@implementation CardCollection

-(instancetype) initWithCardInfo {
    
    self = [super init];
    
    if( self ) {
        
        self.nomalCardArry = @[@"Archers",
                               @"Bomber",
                               @"Spear Goblins",
                               @"Goblins",
                               @"Skeletons",
                               @"Minions",
                               @"Barbarians",
                               @"Minion Horde",
                               @"Fire Spirits",
                               @"Elite Barbarians",
                               @"Royal Giant",
                               @"Ice Spirit",
                               @"Goblin Gang",
                               @"Knight"];
        
        self.rareCardArry  = @[@"Mini PEKKA",
                               @"Musketeer",
                               @"Giant",
                               @"Valkyrie",
                               @"Hog Rider",
                               @"Wizard",
                               @"Battle Ram",
                               @"Three Musketeers",
                               @"Mega Minion",
                               @"Ice Golem",
                               @"Dart Goblin"];
        
        self.epicCardArry  = @[@"Prince",
                               @"Baby Dragon",
                               @"Skeleton Army",
                               @"Witch",
                               @"Giant Skeleton",
                               @"Balloon",
                               @"PEKKA",
                               @"Golem",
                               @"Dark Prince",
                               @"Guards",
                               @"Bowler",
                               @"Executioner"];
        
        self.legendaryCardArry = @[@"Lava Hound",
                                   @"Inferno Dragon",
                                   @"Ice Wizard",
                                   @"Sparky",
                                   @"Miner",
                                   @"Electro Wizard",
                                   @"Princess",
                                   @"Lumberjack"];
        
    }
    
    return self;
}

- (UIButton *)drawCashAreaWithImageName:(NSString *)imageName {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 70, 90);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitle:@"test" forState:UIControlStateNormal];
    
    [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    return button;
}

@end
