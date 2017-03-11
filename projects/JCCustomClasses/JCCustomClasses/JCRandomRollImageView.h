//
//  JCRandomRollImageView.h
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 10..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCRandomRollImageView : UIImageView

- (void)rollWithImageArray:(NSArray <UIImage *>*)array timeIntervel:(NSTimeInterval)timeInterval;

@end
