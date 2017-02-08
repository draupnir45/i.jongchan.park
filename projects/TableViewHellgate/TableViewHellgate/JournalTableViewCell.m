//
//  JournalTableViewCell.m
//  TableViewHellgate
//
//  Created by 박종찬 on 2017. 2. 8..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "JournalTableViewCell.h"


@implementation JournalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.journalTitleLabel = [[UILabel alloc] init];
    self.journalWrittenDateLabel = [[UILabel alloc] init];
    [self.journalTitleLabel setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightMedium]];
    [self.journalTitleLabel setTextColor:[UIColor blackColor]];
    [self.journalTitleLabel setFrame:CGRectMake(20, 16, self.frame.size.width-40, 30)];
    [self.journalWrittenDateLabel setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightMedium]];
    [self.journalWrittenDateLabel setFrame:CGRectMake(20, 51, self.frame.size.width-40, 22)];
    [self.journalWrittenDateLabel setTextColor:[UIColor blackColor]];
    [self addSubview:self.journalTitleLabel];
    [self addSubview:self.journalWrittenDateLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
