//
//  CustomTableViewCell.m
//  TableViewPrac
//
//  Created by 박종찬 on 2017. 2. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "CustomTableViewCell.h"
@interface CustomTableViewCell()



@end



@implementation CustomTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)createSubviews {
    

    
}


- (void)layoutSubviews {
    [super layoutSubviews];

}

@end
