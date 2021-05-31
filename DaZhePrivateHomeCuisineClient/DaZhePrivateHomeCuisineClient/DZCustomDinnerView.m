//
//  DZCustomDinnerView.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/2/3.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//

#import "DZCustomDinnerView.h"
#import "SDWebImage/UIButton+WebCache.h"
@implementation DZCustomDinnerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame ImageView:(NSString *)imageUrl Title:(NSString *)title{
    self=[super initWithFrame:frame];
    if (self) {
        UIButton *imageBt=[UIButton buttonWithType:UIButtonTypeCustom];
        [imageBt addTarget:self action:@selector(toDetail:) forControlEvents:UIControlEventTouchUpInside];
        imageBt.frame=CGRectMake(21, 7,self.width-42, 144/2);
        [imageBt sd_setBackgroundImageWithURL:[NSURL URLWithString:imageUrl] forState:UIControlStateNormal];
        UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(21,imageBt.bottom+2, self.width-42, 20)];
        titleLabel.text=title;
        titleLabel.textAlignment=NSTextAlignmentLeft;
        titleLabel.backgroundColor=[UIColor clearColor];
        titleLabel.font=[UIFont systemFontOfSize:10];
        titleLabel.textColor=[UIColor grayColor];
        [self addSubview:imageBt];
        [self addSubview:titleLabel];
        
    }
    return self;
}
-(void)toDetail:(UIButton*)bt{
    
}
@end
