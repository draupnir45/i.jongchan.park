//
//  JournalItems.h
//  TableViewHellgate
//
//  Created by 박종찬 on 2017. 2. 7..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JournalItems : NSObject

@property (readonly)NSString *journalTitle;
@property (readonly)NSString *journalContent;
@property (readonly)NSDate *writtenDate;
@property (readonly)UIImage *image;

-(void)setJournalTitle:(NSString *)journalTitle;
-(void)setJournalContent:(NSString *)journalContent;
-(void)setWrittenDate:(NSDate *)writtenDate;
-(void)setImage:(UIImage *)image;

@end
