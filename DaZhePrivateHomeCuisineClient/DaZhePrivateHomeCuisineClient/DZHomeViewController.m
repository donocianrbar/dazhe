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
#import "DZHeadTableViewCell.h"
#import "DZDinningDetailViewController.h"
@interface DZHomeViewController (){
    int selectIndex;
    NSMutableArray *dataArray;
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
    dataArray=[NSMutableArray array];
    [self loadSubView];
    [self loadHomeData];
    // Do any additional setup after loading the view.
}
-(void)loadHomeData{
    
    NSDictionary *dir=[NSDictionary dictionaryWithObjectsAndKeys:@"bcastr",@"act",@"4",@"num", nil];
    [[BaseService shareNetworkService] requestActivityParameters:dir DataSouce:nil RequestType:Request_HomePageInfo Block:^(__weak id data, NSError *error) {
        if (!error) {
            [self loadAdviceData];
            _homeDataModel=data;
            [dataArray addObject:_homeDataModel.bcastrPicInfo];
            [dataArray addObject:_homeDataModel.RestaurantInfo];
            [dataArray addObject:@"nav"];
            [dataArray addObject:@"head"];
            if (_homeDataModel.ZheKouInfo.count>0) {
                for (int i=0; i<_homeDataModel.ZheKouInfo.count; i++) {
                    DZZheKouInfoModel *model=_homeDataModel.ZheKouInfo[i];
                    [dataArray addObject:model];
                }
            }
            if (_homeDataModel.bcastrPicInfo1.count>0) {
                for (int i=0; i<_homeDataModel.bcastrPicInfo1.count; i++) {
                    DZAlternationItemModel *model=_homeDataModel.bcastrPicInfo1[i];
                    [dataArray addObject:model];
                }
            }
            
            [_listView reloadData];
        }
    }];

}
-(void)loadAdviceData{
    NSDictionary *dir=[NSDictionary dictionaryWithObjectsAndKeys:@"advice",@"act",@"1",@"cityid", nil];
    [[BaseService shareNetworkService] requestActivityParameters:dir DataSouce:nil RequestType:Request_GetAdviceInfo Block:^(__weak id data, NSError *error) {
        
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
        NSArray *controllerArray = [NSArray arrayWithObjects:@"DZDiningRoomSearchNav",@"DZAgioPreferentialNav",@"DZCommendedNav",@"DZPrivateHomeCuisineNav",nil];//类名数组
        NSArray *titleArray = [NSArray arrayWithObjects:@"餐厅查询",@"折扣优惠",@"大哲推荐",@"大哲私房菜", nil];//item标题数组
        NSArray *normalImageArray = [NSArray arrayWithObjects:@"canting_chaxun.png",@"zhekou.png",@"tuijian.png",@"sifangcai.png", nil];//item 正常状态下的背景图片
        NSArray *selectedImageArray = [NSArray arrayWithObjects:@"canting_chaxun_push.png", @"zhekou_push.png",@"tuijian_push.png",@"sifangcai_push.png",nil];//item被选中时的图片名称
        
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
        UIImageView *logoView=[[UIImageView alloc] initWithFrame:CGRectMake(10,SYSTEM_VERSION>=7.0?26:6, 189/2, 45/2)];
        logoView.image=[UIImage imageNamed:@"logo"];
        [_homeNavView addSubview:logoView];
        UIButton *searchBt=[UIButton buttonWithType:UIButtonTypeCustom];
        searchBt.frame=CGRectMake(0, 0, 397/2, 57/2);
        searchBt.left=logoView.right+10;
        searchBt.top=logoView.top-2;
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
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id obj=dataArray[indexPath.row];
    if ([obj isKindOfClass:[NSArray class]]) {
        NSArray *objArray=obj;
        if (objArray.count>0) {
            if ([objArray[0] isKindOfClass:[DZAlternationItemModel class]]) {
                DZAlternationItemModel *modle=objArray[0];
                if ([modle.groupname isEqualToString:@"mobile"]) {
                     //轮播图
                    static NSString *cellIdentifier=@"DZWheeViewlTableViewCell";
                    DZWheeViewlTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                    if (!cell) {
                        cell = [[[NSBundle mainBundle] loadNibNamed:@"DZWheeViewlTableViewCell"  owner:self options:nil] lastObject];
                    }
                    [cell loadData:_homeDataModel.bcastrPicInfo];
                    return cell;
                }
            }else if ([objArray[0] isKindOfClass:[DZRestaurantinfoModel class]]){
                static NSString *cellIdentifier=@"DZRecommendTableViewCell";
                DZRecommendTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if (!cell) {
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"DZRecommendTableViewCell"  owner:self options:nil] lastObject];
                }
                [cell loadData:_homeDataModel.RestaurantInfo];
                return cell;
            }
        }
    }else if ([obj isEqual:@"nav"]){
        static NSString *cellIdentifier=@"DZNavTableViewCell";
        DZNavTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DZNavTableViewCell"  owner:self options:nil] lastObject];
        }
        return cell;
    }else if ([obj isEqual:@"head"]){
        static NSString *cellIdentifier=@"DZHeadTableViewCell";
        DZHeadTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DZHeadTableViewCell"  owner:self options:nil] lastObject];
        }
        return cell;
    }else if ([obj isKindOfClass:[DZZheKouInfoModel class]]){
        static NSString *cellIdentifier=@"DZDaZheTableViewCell";
        DZDaZheTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DZDaZheTableViewCell"  owner:self options:nil] lastObject];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell loadData:obj];
        return cell;
    }else if([obj isKindOfClass:[DZAlternationItemModel class]]){
        //底部广告
        DZAlternationItemModel *modle=obj;
        static NSString *cellIdentifier=@"DZAdvertisementTableViewCell";
        DZAdvertisementTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DZAdvertisementTableViewCell"  owner:self options:nil] lastObject];
        }
        [cell loadImageUrlStr:modle.link];
        return cell;

    }
    
    return nil;
}

#pragma mark-UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id obj=dataArray[indexPath.row];
    if ([obj isKindOfClass:[NSArray class]]) {
        NSArray *objArray=obj;
        if (objArray.count>0) {
            if ([objArray[0] isKindOfClass:[DZAlternationItemModel class]]) {
                DZAlternationItemModel *modle=objArray[0];
                if ([modle.groupname isEqualToString:@"mobile"]) {
                    return 161;
                }
            }else if ([objArray[0] isKindOfClass:[DZRestaurantinfoModel class]]){
                return 274/2;
            }
        }
    }else if ([obj isEqual:@"nav"]){
        return 101;
        
    }else if ([obj isEqual:@"head"]){
        return 30;
        
    }else if ([obj isKindOfClass:[DZZheKouInfoModel class]]){
        return 94;
    
    }else if([obj isKindOfClass:[DZAlternationItemModel class]]){
       
        return 236/2;
    }
    return 0;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       id obj=dataArray[indexPath.row];
    if ([obj isKindOfClass:[DZZheKouInfoModel class]]) {
        DZDinningDetailViewController *detailVC=[[DZDinningDetailViewController alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}
-(void)tableView:(UITableView*)tableView  willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
    
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
