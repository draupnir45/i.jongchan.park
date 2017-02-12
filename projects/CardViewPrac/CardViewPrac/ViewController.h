//
//  ViewController.h
//  CardViewPrac
//
//  Created by 박종찬 on 2017. 2. 10..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIScrollViewDelegate>

//Displaying View Array
//Animating View Array
//Opened Item
//Frame Size
//Card Rect
//Scroll View
//Data Array
//Back holder
//Front holder
//ItemOpened
//SelectedItem

-(void)animateItemViewsAtIndex:(NSInteger)index fromSelectedItemIndex:(NSInteger)selectedItemIndex;
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;
-(void)closeItem;
-(void)openItemAtIndex:(NSInteger)index;
-(void)startEditing;

@end

