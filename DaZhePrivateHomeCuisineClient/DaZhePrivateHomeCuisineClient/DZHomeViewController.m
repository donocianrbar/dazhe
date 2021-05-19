//
//  DZHomeViewController.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-9.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZHomeViewController.h"
#import "DZWheeViewlTableViewCell.h"
#import "DZRecommendTableViewCell.h"
#import "DZNavTableViewCell.h"
#import "DZAdvertisementTableViewCell.h"
#import "DZDaZheTableViewCell.h"
#import "DZHomeDataModel.h"
@interface DZHomeViewController (){
    int selectIndex;
}

@end

@implementation DZHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    [self loadSubView];
    [self loadHomeData];
    // Do any additional setup after loading the view.
}
-(void)loadHomeData{
    
    NSDictionary *dir=[NSDictionary dictionaryWithObjectsAndKeys:@"bcastr",@"act",@"2",@"num", nil];
    [[BaseService shareNetworkService] requestActivityParameters:dir DataSouce:nil RequestType:Request_HomePageInfo Block:^(__weak id data, NSError *error) {
        _homeDataModel=data;
        [_listView reloadData];
    }];

}
-(void)loadSubView
{
    [self.view addSubview:self.homeNavView];
    [self.view addSubview:self.listView];
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)toTabarViewAction:(int)tag{
    selectIndex=tag-100;
    [self.navigationController pushViewController:self.tabBarController animated:YES];
    [self.tabBarController.tabBar selectedItemAtIndex:tag-100];
    
}
#pragma mark-getter
-(MALTabBarViewController*)tabBarController
{
    if (!_tabBarController) {
        NSMutableArray *itemsArray = [[NSMutableArray alloc] init] ;
        NSArray *controllerArray = [NSArray arrayWithObjects:@"DZDiningRoomSearchNav",@"DZPrivateHomeCuisineNav",@"DZCommendedNav",@"DZAgioPreferentialNav",nil];//类名数组
        NSArray *titleArray = [NSArray arrayWithObjects:@"餐厅查询",@"大哲私房菜",@"大哲推荐",@"折扣优惠", nil];//item标题数组
        NSArray *normalImageArray = [NSArray arrayWithObjects:@"canting_chaxun.png",@"sifangcai.png",@"tuijian.png",@"zhekou.png", nil];//item 正常状态下的背景图片
        NSArray *selectedImageArray = [NSArray arrayWithObjects:@"canting_chaxun_push.png", @"sifangcai_push.png",@"tuijian_push.png",@"zhekou_push.png",nil];//item被选中时的图片名称
        
        for (int i = 0; i< controllerArray.count; i++) {
            
            MALTabBarItemModel *itemModel = [[MALTabBarItemModel alloc] init];
            itemModel.controllerName = controllerArray[i];
            itemModel.itemTitle = titleArray[i];
            itemModel.itemImageName = normalImageArray[i];
            itemModel.selectedItemImageName = selectedImageArray[i];
            [itemsArray addObject:itemModel];
        }
        
        _tabBarController = [[MALTabBarViewController alloc] initWithItemModels:itemsArray defaultSelectedIndex:selectIndex];

    }
    return _tabBarController;
}
-(UIView*)homeNavView
{
    if (!_homeNavView) {
        _homeNavView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SYSTEM_VERSION>=7.0?44+20:44)];
        _homeNavView.backgroundColor=[UIColor colorWithHexString:@"FF9326"];
        UIImageView *logoView=[[UIImageView alloc] initWithFrame:CGRectMake(10,SYSTEM_VERSION>=7.0?26:6, 137/2, 62/2)];
        logoView.image=[UIImage imageNamed:@"logo"];
        [_homeNavView addSubview:logoView];
        UIButton *searchBt=[UIButton buttonWithType:UIButtonTypeCustom];
        searchBt.frame=CGRectMake(0, 0, 397/2, 57/2);
        searchBt.left=logoView.right+10;
        searchBt.top=logoView.top;
        [searchBt setBackgroundImage:IMG(@"search_bg") forState:UIControlStateNormal];
        [searchBt setTitle:@"搜一搜" forState:UIControlStateNormal];
        [searchBt addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *searchImage=[[UIImageView alloc] initWithFrame:CGRectMake(50, 4, 20, 20)];
        searchImage.image=IMG(@"search");
        [searchBt addSubview:searchImage];
        [_homeNavView addSubview:searchBt];
    }
    return _homeNavView;
}
-(UITableView *)listView
{
    if (!_listView) {
        _listView=[[UITableView alloc] initWithFrame:CGRectMake(0,self.homeNavView.bottom,SCREEN_WIDTH,SYSTEM_VERSION>=7.0?SCREEN_HEIGHT-self.homeNavView.height:SCREEN_HEIGHT-self.homeNavView.height-20) style:UITableViewStylePlain];
        _listView.delegate=self;
        _listView.dataSource=self;
        _listView.backgroundColor=[UIColor clearColor];
        _listView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
    }
    return _listView;
}
#pragma mark-搜索action
-(void)searchAction:(UIButton*)bt{
    
}
#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case  0:
        {
            static NSString *cellIdentifier=@"DZWheeViewlTableViewCell";
            DZWheeViewlTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"DZWheeViewlTableViewCell"  owner:self options:nil] lastObject];
            }
            [cell loadData:_homeDataModel.bcastrPicInfo];
            return cell;
        }
            break;
        case  1:
        {
            static NSString *cellIdentifier=@"DZRecommendTableViewCell";
            DZRecommendTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"DZRecommendTableViewCell"  owner:self options:nil] lastObject];
            }
            return cell;
  
        }
            break;
        case  2:
        {
            static NSString *cellIdentifier=@"DZNavTableViewCell";
            DZNavTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"DZNavTableViewCell"  owner:self options:nil] lastObject];
            }
            return cell;
            
        }
            break;
        case  3:
        {
            static NSString *cellIdentifier=@"DZDaZheTableViewCell";
            DZDaZheTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"DZDaZheTableViewCell"  owner:self options:nil] lastObject];
            }
            return cell;

            
        }
            break;
        case  4:
        case  5:
        {
            static NSString *cellIdentifier=@"DZAdvertisementTableViewCell";
            DZAdvertisementTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"DZAdvertisementTableViewCell"  owner:self options:nil] lastObject];
            }
            return cell;
            
            
        }
            break;
        default:
            break;
    }
    
    return nil;
}

#pragma mark-UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 161;
            break;
        case 1:
            return 101;
            break;
        case 2:
            return 101;
            break;
        case 3:
            return 119;
            break;
        case 4:
            return 101;
            break;
            
            
        default:
            break;
    }
    return 101;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
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
