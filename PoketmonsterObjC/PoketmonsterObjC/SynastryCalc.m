//
//  SynastryCalc.m
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SynastryCalc.h"

@implementation SynastryCalc

- (float)calcSynastryFrom:(id)attacker
                     to:(id)target {
    if (attacker == target) {
        return 1.0;
    } else if (
               ([attacker isEqual:@"fire"] && [target isEqual:@"leaf"])|| ([attacker isEqual:@"fire"] && [target isEqual:@"leaf"]) || ([attacker isEqual:@"fire"] && [target isEqual:@"leaf"])
               )
    {
        return 2.0;
    } else {
        return 0.5;
    }
    
}

@end
