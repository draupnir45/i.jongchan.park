//
//  SpecialContact.h
//  Day2
//
//  Created by 박종찬 on 2017. 1. 17..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "Person.h"

@interface SpecialContact : Person

@property id anniversary;
@property id nickName;
@property id shortCut;


- (void)setAnniversary:(id)date;

@end
