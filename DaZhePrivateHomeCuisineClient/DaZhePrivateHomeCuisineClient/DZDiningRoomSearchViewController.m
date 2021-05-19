//
//  DZDiningRoomSearchViewController.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-9.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZDiningRoomSearchViewController.h"
@implementation DZDiningRoomSearchNav
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor clearColor];
    DZDiningRoomSearchViewController *classVC=[[DZDiningRoomSearchViewController alloc] init];
    self.viewControllers = @[classVC];
    
}

@end


@interface DZDiningRoomSearchViewController (){
    NSArray *titleArray;
    NSArray *array1;
    NSArray *array2;
    NSArray *array3;
    NSArray *array4;
}

@end

@implementation DZDiningRoomSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    titleArray=[NSArray arrayWithObjects:@"外卖",@"特色菜",@"档次",@"区域", nil];
    array1=@[@"水煮鱼",@"骨头",@"鱼头"];
    array2=@[@"水煮鱼",@"骨头",@"鱼头",@"水煮鱼",@"骨头"];
    array3=@[@"水煮鱼",@"骨头",@"鱼头",@"水煮鱼",@"骨头",@"水煮鱼",@"骨头"];
    array4=@[@"水煮鱼",@"骨头",@"鱼头",@"水煮鱼",@"骨头",@"水煮鱼",@"骨头",@"水煮鱼",@"骨头"];
    
    [self navView];
    [self addTitle:@"餐厅查询"];
    [self loadSubView];
    // Do any additional setup after loading the view.
}
-(void)loadSubView
{
    [self.view addSubview:self.menuView];
    [self.view addSubview:self.diningRoomListView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backAction:(UIButton*)bt
{
    [SharedAppDelegate.home.tabBarController.navigationController popViewControllerAnimated:YES];
}
#pragma mark-getter
-(CustomMenuView*)menuView
{
    if (!_menuView) {
        _menuView=[[CustomMenuView alloc] initWithFrame:CGRectMake(0,self.navView.bottom, SCREEN_WIDTH, 40) WithTitleArray:titleArray];
    }
    return _menuView;
}
-(UITableView*)diningRoomListView
{
    if (!_diningRoomListView) {
        _diningRoomListView=[[UITableView alloc] initWithFrame:CGRectMake(0,self.menuView.bottom,SCREEN_WIDTH,SYSTEM_VERSION>=7.0?SCREEN_HEIGHT-self.navView.height-self.menuView.height-49:SCREEN_HEIGHT-self.navView.height-self.menuView.height-20-49) style:UITableViewStylePlain];
        _diningRoomListView.delegate=self;
        _diningRoomListView.dataSource=self;
        [self.view addSubview:_diningRoomListView];
    }
    return _diningRoomListView;
}
#pragma mark - table datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"DZDinningRoomTableViewCell";
    DZDinningRoomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DZDinningRoomTableViewCell"  owner:self options:nil] lastObject];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZDinningDetailViewController *dinningDetail=[[DZDinningDetailViewController alloc] init];
    [self.navigationController pushViewController:dinningDetail animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
