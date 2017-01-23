//
//  SynastryCalc.m
//  PoketmonsterObjC
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SynastryCalculator.h"
#import "Pokemon.h"
#import "Type.h"
#import <CoreGraphics/CoreGraphics.h>

@interface SynastryCalculator()

@property (readwrite) Type *typeRef;

@end

@implementation SynastryCalculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.typeRef = [[Type alloc]init];
    }
    return self;
}

/** 상성을 통해서 데미지에 곱할 가중치를 구하는 부분입니다.
예를 들어 불 속성 공격을 풀 속성 포켓몬에게 할 경우, 상성에 의해서 기본 데미지가 2배가 됩니다. 또한 풀 포켓몬이 풀 속성 기술을 쓸 경우 자속보정에 의해 해당 데미지가 1.5배가 됩니다. 따라서 최대 3배, 최소 0.5배가 기본 데미지에 곱해질 것입니다.

 @author Jongchan Park
 @date 2017. 1. 17
 @return int
 */
- (CGFloat)calcSynastryFrom:(NSString *)skillType
                     to:(NSString *)targetType {
    //해당 스킬의 기술타입에 따라 계산에 사용될 딕셔너리를 불러옵니다.
    NSDictionary *skillData = [self.typeRef.index objectForKey:skillType];
    //타겟의 타입에 따라 적용될 가중치를 정합니다.
    CGFloat synastry = [[skillData objectForKey:targetType]floatValue];
    
    //상성 가중치를 반환합니다.
    return synastry;
    
}

@end
