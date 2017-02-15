//
//  EditViewController.h
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyDay;

@class EditViewController;
@protocol EditViewControllerDelegate <NSObject>

- (void)editViewWillDoneEditing:(EditViewController *)editViewController;

@end


typedef NS_ENUM(NSInteger, MyDayEditViewStatus) {
    MyDayEditViewStatusEditing,         //카드가 열려있지 않은 상황을 나타냅니다.
    MyDayEditViewStatusAdding
};


@interface EditViewController : UIViewController

@property MyDay *day;
@property NSInteger editViewStatus;
@property (nonatomic, weak) id <EditViewControllerDelegate> delegate;

@end

//EditViewControllerDelegate
