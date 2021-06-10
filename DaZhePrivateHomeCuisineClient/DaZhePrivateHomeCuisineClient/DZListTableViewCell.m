//
//  DZListTableViewCell.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-16.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZListTableViewCell.h"

@implementation DZListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)loaddata:(DZArticlesInfoSubModel *)model{
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",API_DOMAIN,model.picture]]];
    self.nameLabel.text=[NSString stringWithFormat:@"%@ (%@)",model.name,model.total];
}
-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGContextStrokeRect(context, CGRectMake(10, rect.size.height, rect.size.width-20, 1));
    
}
@end
