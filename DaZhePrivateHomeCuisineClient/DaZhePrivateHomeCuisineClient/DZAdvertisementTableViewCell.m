//
//  DZAdvertisementTableViewCell.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZAdvertisementTableViewCell.h"

@implementation DZAdvertisementTableViewCell

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
-(void)loadImageUrlStr:(NSString *)urlStr{
    [self.backImageView sd_setImageWithURL: [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",API_DOMAIN,urlStr]]];
}
@end
