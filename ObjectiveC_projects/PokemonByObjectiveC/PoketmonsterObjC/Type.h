//
//  Type.h
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 18..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Type : NSObject

@property (readonly)NSDictionary *normal;
@property (readonly)NSDictionary *fire;
@property (readonly)NSDictionary *water;
@property (readonly)NSDictionary *electricity;
@property (readonly)NSDictionary *leaf;
@property (readonly)NSDictionary *ice;
@property (readonly)NSDictionary *combat;
@property (readonly)NSDictionary *poison;
@property (readonly)NSDictionary *land;
@property (readonly)NSDictionary *flying;
@property (readonly)NSDictionary *esper;
@property (readonly)NSDictionary *bug;
@property (readonly)NSDictionary *rock;
@property (readonly)NSDictionary *ghost;
@property (readonly)NSDictionary *dragon;
@property (readonly)NSDictionary *evil;
@property (readonly)NSDictionary *iron;

@property (readonly)NSDictionary *index;

@end
