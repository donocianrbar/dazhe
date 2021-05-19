//
//  CustomMenuView.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-14.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "CustomMenuView.h"

@implementation CustomMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame WithTitleArray:(NSArray *)titles
{
    self=[self initWithFrame:frame];
    _titles=titles;
    if (self) {
        [self addSubViews];
        self.backgroundColor=[UIColor colorWithHexString:@"F7F7F7"];
    }
    return self;
}
-(void)addSubViews
{
    float width=SCREEN_WIDTH/_titles.count;
    float height=40.0;
    for (int i=0; i<_titles.count; i++) {
        UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
        [bt setTitle:_titles[i] forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor colorWithHexString:@"222222"] forState:UIControlStateNormal];
        bt.frame=CGRectMake(width*i, 0, width, height);
        bt.tag=100+i;
        [bt addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt];
    }
}
-(void)tapAction:(UIButton*)bt
{
       if (self.lineView.hidden) {
           self.lineView.hidden=NO;
           self.lineView.left=(bt.tag-100)*80;
    }
    [UIView animateWithDuration:0.2 animations:^{
      self.menuListView.height=180;
      self.lineView.left=(bt.tag-100)*80;
    }];
}
#pragma mark-getter
-(UIView*)lineView
{
    if (!_lineView) {
        _lineView=[[UIView alloc] initWithFrame:CGRectMake(0, 39, 80, 1)];
        _lineView.backgroundColor=[UIColor redColor];
        [self addSubview:_lineView];
        
    }
    return _lineView;
}
-(UITableView*)menuListView
{
    if (!_menuListView) {
        _menuListView=[[UITableView alloc] initWithFrame:CGRectMake(0, self.bottom, SCREEN_WIDTH, 1)];
        _menuListView.delegate=self;
        _menuListView.dataSource=self;
        _menuListView.separatorStyle=UITableViewCellSeparatorStyleNone;
        [self.superview addSubview:_menuListView];
        
    }
    return _menuListView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark - table datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"DropDownMenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.contentView.backgroundColor=[UIColor colorWithHexString:@"EEEEEE"];
    cell.textLabel.text=@"111";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:0.2 animations:^{
        self.menuListView.height=0;
        self.lineView.hidden=YES;
    }];
}
@end
