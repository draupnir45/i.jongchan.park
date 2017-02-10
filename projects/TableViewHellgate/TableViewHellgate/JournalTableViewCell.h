//
//  JournalTableViewCell.h
//  TableViewHellgate
//
//  Created by 박종찬 on 2017. 2. 8..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JournalItems;

@interface JournalTableViewCell : UITableViewCell

@property (nonatomic, getter=getData)JournalItems *cellData;
@property (getter=isFinished)BOOL *finished;
@property UILabel *journalTitleLabel;
@property UILabel *journalWrittenDateLabel;

//-(void)setCellData:(JournalItems *)cellData;
-(JournalItems *)cellData;

@end
