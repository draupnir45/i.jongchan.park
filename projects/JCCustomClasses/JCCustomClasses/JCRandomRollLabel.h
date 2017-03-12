//
//  JCRandomRollLabel.h
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 12..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCRandomRollLabel : UILabel

@property NSTimer *rollingTimer;
@property NSInteger rollingIndex;
@property NSArray *textArray;
@property NSInteger repeatNumb;

@end
