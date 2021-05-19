//
//  DZDinningDetailViewController.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-15.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZDinningDetailViewController.h"

@interface DZDinningDetailViewController ()

@end

@implementation DZDinningDetailViewController

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
    [self navView];
    [self addTitle:@"餐厅详情"];
    [self loadSubView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backAction:(UIButton *)bt{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)loadSubView
{
    [self.view addSubview:self.listView];
}
-(UITableView *)listView
{
    if (!_listView) {
        _listView=[[UITableView alloc] initWithFrame:CGRectMake(0,self.navView.bottom,SCREEN_WIDTH,SYSTEM_VERSION>=7.0?SCREEN_HEIGHT-self.navView.height-49:SCREEN_HEIGHT-self.navView.height-20-49) style:UITableViewStylePlain];
        _listView.delegate=self;
        _listView.dataSource=self;
        _listView.backgroundColor=[UIColor clearColor];
        _listView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _listView;
}
#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        static NSString *cellIdentifier=@"DZRoomDetailTableViewCell";
        DZRoomDetailTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DZRoomDetailTableViewCell"  owner:self options:nil] lastObject];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
        
    }else{
        static NSString *cellIdentifier=@"DZDeailDownTableViewCell";
        DZDeailDownTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DZDeailDownTableViewCell"  owner:self options:nil] lastObject];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
        
    }
}

#pragma mark-UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 385;
    }else{
        return 124;
    }
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
