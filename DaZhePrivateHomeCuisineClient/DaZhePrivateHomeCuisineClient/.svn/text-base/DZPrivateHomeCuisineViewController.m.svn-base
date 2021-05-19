//
//  DZPrivateHomeCuisineViewController.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-9.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZPrivateHomeCuisineViewController.h"
@implementation DZPrivateHomeCuisineNav
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
    DZPrivateHomeCuisineViewController *classVC=[[DZPrivateHomeCuisineViewController alloc] init];
    self.viewControllers = @[classVC];
    
}


@end

@interface DZPrivateHomeCuisineViewController ()

@end

@implementation DZPrivateHomeCuisineViewController

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
    [self addTitle:@"大哲私房菜"];
    [self loadSubView];
    // Do any additional setup after loading the view.
}
-(void)loadSubView
{
    [self.view addSubview:self.listView];
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        static NSString *cellIdentifier=@"DZHeadTableViewCell";
        DZHeadTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DZHeadTableViewCell"  owner:self options:nil] lastObject];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
  
    }else{
        static NSString *cellIdentifier=@"DZListTableViewCell";
        DZListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"DZListTableViewCell"  owner:self options:nil] lastObject];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
 
    }
}

#pragma mark-UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 180;
    }else{
        return 90;
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
