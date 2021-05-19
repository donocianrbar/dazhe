//
//  DZDaZheTableViewCell.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZDaZheTableViewCell.h"

@implementation DZDaZheTableViewCell

- (void)awakeFromNib {
    // Initialization code
     self.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
     self.contentView.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
     self.titleLabel.textColor=[UIColor colorWithHexString:@"4D4D4D"];
     self.lineView.height=0.5;
     self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
