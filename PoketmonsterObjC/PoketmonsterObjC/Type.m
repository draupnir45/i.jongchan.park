//
//  Type.m
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 18..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Type.h"
//, @"normal" :
//, @"fire" :
//, @"water" :
//, @"electricity" :
//, @"leaf" :
//, @"ice" :
//, @"combat" :
//, @"poison" :
//, @"land" :
//, @"flying" :
//, @"esper" :
//, @"bug" :
//, @"rock" :
//, @"ghost" :
//, @"dragon" :
//, @"evil" :
//, @"iron" :

@implementation Type

-(Type *)init {
    self = [super init];
    
    self.normal = @{@"rock" : @0.5, @"ghost" : @0, @"iron" : @0.5};
    self.fire = @{@"fire" : @0.5, @"water" : @0.5, @"rock" : @0.5, @"dragon" : @0.5, @"leaf" : @2, @"ice" : @2, @"bug" : @2, @"iron" : @2};
    self.water = @{@"water" : @0.5, @"leaf" : @0.5, @"dragon" : @0.5, @"fire" : @2, @"land" : @2, @"rock" : @2};
    self.electricity = @{@"electricity" : @0.5, @"leaf" : @0.5, @"dragon" : @0.5, @"water" : @2, @"flying" : @2, @"land" : @0};
    self.leaf = @{@"fire" : @0.5, @"leaf" : @0.5, @"poison" : @0.5, @"flying" : @0.5, @"bug" : @0.5, @"dragon" : @0.5, @"iron" : @0.5, @"water" : @2, @"land" : @2, @"rock" : @2 };
    self.ice = @{@"fire" : @0.5, @"water" : @0.5, @"ice" : @0.5, @"iron" : @0.5, @"leaf" : @2, @"land" : @2, @"flying" : @2, @"dragon" : @2 };
    self.combat = @{@"poison" : @0.5, @"flying" : @0.5, @"esper" : @0.5, @"bug" : @0.5, @"normal" : @2, @"ice" : @2, @"rock" : @2, @"evil" : @2, @"iron" : @2, @"ghost": @0};
    self.poison = @{@"poison" : @0.5, @"land" : @0.5, @"rock" : @0.5, @"ghost" : @0.5, @"leaf" : @2, @"iron" : @0};
    self.land = @{@"leaf" : @0.5, @"bug" : @0.5, @"fire" : @2, @"electricity" : @2, @"poison" : @2, @"rock" : @2, @"iron" : @2, @"flying" : @0};
    self.flying = @{ @"normal" : @1, @"fire" : @1, @"water" : @1, @"electricity" : @0.5, @"leaf" : @2, @"ice" : @1, @"combat" : @2, @"poison" : @1, @"land" : @1, @"flying" : @1, @"esper" : @1, @"bug" : @2, @"rock" : @0.5, @"ghost" : @1, @"dragon" : @1, @"evil" : @1, @"iron" : @0.5};
    self.esper = @{ @"normal" : @1, @"fire" : @1, @"water" : @1, @"electricity" : @1, @"leaf" : @1, @"ice" : @1, @"combat" : @2, @"poison" : @2, @"land" : @1, @"flying" : @1, @"esper" : @0.5, @"bug" : @1, @"rock" : @1, @"ghost" : @1, @"dragon" : @1, @"evil" : @0, @"iron" : @0.5};
    
    //Work In Progress...
    self.bug = @{ @"normal" : @1, @"fire" : @1, @"water" : @1, @"electricity" : @1, @"leaf" : @1, @"ice" : @1, @"combat" : @1, @"poison" : @1, @"land" : @1, @"flying" : @1, @"esper" : @1, @"bug" : @1, @"rock" : @1, @"ghost" : @1, @"dragon" : @1, @"evil" : @1, @"iron" : @1};
    self.rock = @{ @"normal" : @1, @"fire" : @1, @"water" : @1, @"electricity" : @1, @"leaf" : @1, @"ice" : @1, @"combat" : @1, @"poison" : @1, @"land" : @1, @"flying" : @1, @"esper" : @1, @"bug" : @1, @"rock" : @1, @"ghost" : @1, @"dragon" : @1, @"evil" : @1, @"iron" : @1};
    self.ghost = @{ @"normal" : @1, @"fire" : @1, @"water" : @1, @"electricity" : @1, @"leaf" : @1, @"ice" : @1, @"combat" : @1, @"poison" : @1, @"land" : @1, @"flying" : @1, @"esper" : @1, @"bug" : @1, @"rock" : @1, @"ghost" : @1, @"dragon" : @1, @"evil" : @1, @"iron" : @1};
    self.dragon = @{ @"normal" : @1, @"fire" : @1, @"water" : @1, @"electricity" : @1, @"leaf" : @1, @"ice" : @1, @"combat" : @1, @"poison" : @1, @"land" : @1, @"flying" : @1, @"esper" : @1, @"bug" : @1, @"rock" : @1, @"ghost" : @1, @"dragon" : @1, @"evil" : @1, @"iron" : @1};
    self.evil = @{ @"normal" : @1, @"fire" : @1, @"water" : @1, @"electricity" : @1, @"leaf" : @1, @"ice" : @1, @"combat" : @1, @"poison" : @1, @"land" : @1, @"flying" : @1, @"esper" : @1, @"bug" : @1, @"rock" : @1, @"ghost" : @1, @"dragon" : @1, @"evil" : @1, @"iron" : @1};
    self.iron = @{ @"normal" : @1, @"fire" : @1, @"water" : @1, @"electricity" : @1, @"leaf" : @1, @"ice" : @1, @"combat" : @1, @"poison" : @1, @"land" : @1, @"flying" : @1, @"esper" : @1, @"bug" : @1, @"rock" : @1, @"ghost" : @1, @"dragon" : @1, @"evil" : @1, @"iron" : @1};
                  
    NSDictionary *index = @{ @"normal" : self.normal, @"fire" : self.fire, @"water": self.water};
    
    return self;
}

@end
