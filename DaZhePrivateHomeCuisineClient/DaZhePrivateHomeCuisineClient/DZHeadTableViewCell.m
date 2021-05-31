//
//  DZHeadTableViewCell.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/2/3.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//

#import "DZHeadTableViewCell.h"

@implementation DZHeadTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lineView.height=0.2;
    self.lineView.bottom=self.bottom;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width, 1));
    
}

@end
