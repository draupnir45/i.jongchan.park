//
//  SynastryCalc.h
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SynastryCalc : NSObject

- (float)calcSynastryFrom:(id)attacker
                     to:(id)target;

@end
