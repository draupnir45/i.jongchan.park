//
//  TextViewCell.h
//  TextViewInTableViewPrac
//
//  Created by 박종찬 on 2017. 4. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SZTextView;

@interface SBTextViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end
