//
//  DZNavTableViewCell.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZNavTableViewCell.h"

@implementation DZNavTableViewCell

- (void)awakeFromNib {
    // Initialization code
     self.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
     self.contentView.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
     self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)navAction:(id)sender {
    UIButton *bt=(UIButton*)sender;
    [SharedAppDelegate.home toTabarViewAction:bt.tag];
}
@end
