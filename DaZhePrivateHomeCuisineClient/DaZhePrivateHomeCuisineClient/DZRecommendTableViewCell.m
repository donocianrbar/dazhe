//
//  DZRecommendTableViewCell.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZRecommendTableViewCell.h"
#import "DZCustomDinnerView.h"
@implementation DZRecommendTableViewCell

- (void)awakeFromNib {
    // Initialization code
     self.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
     self.contentView.backgroundColor=[UIColor colorWithHexString:@"ECECEC"];
     self.titleLabel.textColor=[UIColor colorWithHexString:@"4D4D4D"];
     self.selectionStyle=UITableViewCellSelectionStyleNone;
     self.lineView.height=0.5;
     self.backScrollow.showsHorizontalScrollIndicator=NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loadData:(NSArray *)dataArray{
    if (dataArray.count>0) {
        self.backScrollow.contentSize=CGSizeMake(160*dataArray.count,105);
        for (int i=0; i<dataArray.count; i++) {
            DZRestaurantinfoModel *modle=dataArray[i];
            DZCustomDinnerView *dinnerView=[[DZCustomDinnerView alloc] initWithFrame:CGRectMake(160*i,0,160,105) ImageView:[NSString stringWithFormat:@"%@/%@",API_DOMAIN,modle.thumb] Title:modle.name];
            [self.backScrollow addSubview:dinnerView];
        }
    }
}
@end
