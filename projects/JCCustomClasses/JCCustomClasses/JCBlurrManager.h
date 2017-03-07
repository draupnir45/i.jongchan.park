//
//  JCBlurrManager.h
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 7..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JCBlurrManager : NSObject

///뷰를 블러합니다.
+ (void)blurrView:(UIView *)view
  withEffectStyle:(UIBlurEffectStyle)effectStyle;

///뷰를 블러하면서 옵션에 따라 애니메이션을 넣습니다.
+ (void)    blurrView:(UIView *)view
      withEffectStyle:(UIBlurEffectStyle)effectStyle
  animateWithDuration:(CGFloat)duration
                delay:(CGFloat)delay
              options:(UIViewAnimationOptions)options;

@end
