//
//  JCCardScrollView.h
//  DequeuePrac
//
//  Created by 박종찬 on 2017. 2. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JCCardView;

typedef NS_ENUM(NSInteger, JCCardViewStatus) {
    JCCardViewStatusClosed,         //카드가 열려있지 않은 상황을 나타냅니다.
    JCCardViewStatusOpened,
    JCCardViewStatusEditing
};

@interface JCCardScrollView : UIScrollView

@property UITableView *letsLookAtIt;

@end
