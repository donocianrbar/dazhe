//
//  DZRecommendTableViewCell.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZRecommendTableViewCell.h"

@implementation DZRecommendTableViewCell

- (void)awakeFromNib {
    // Initialization code
     self.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
     self.contentView.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
     self.titleLabel.textColor=[UIColor colorWithHexString:@"4D4D4D"];
     self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
