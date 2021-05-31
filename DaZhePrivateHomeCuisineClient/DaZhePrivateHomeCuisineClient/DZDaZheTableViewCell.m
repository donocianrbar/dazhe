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
     //self.dinnerImageView.backgroundColor=[UIColor redColor];
    self.addressLabel.numberOfLines=0;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected stat
}
-(void)loadData:(DZZheKouInfoModel*)model{
    [self.dinnerImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",API_DOMAIN,model.thumb]]];
    self.dinnerImageView.contentMode=UIViewContentModeScaleAspectFit;
    self.dinnerImageView.clipsToBounds=YES;
    self.namelabel.text=model.name;
    self.addressLabel.text=[NSString stringWithFormat:@"地址: %@",model.address];
    self.telLabel.text=[NSString stringWithFormat:@"电话1: %@",model.tel1];
}
-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width, 1));
    
}

@end
