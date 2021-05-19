//
//  WQTestViewController.m
//  WoQuClient
//
//  Created by zouzhisheng on 14-8-23.
//  Copyright (c) 2014年 WQ. All rights reserved.
//

#import "WQTestViewController.h"
@implementation WQClassfiyNav
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
    WQTestViewController *classVC=[[WQTestViewController alloc] init];
    self.viewControllers = @[classVC];
    
}


@end


@interface WQTestViewController ()

@end

@implementation WQTestViewController

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
    [self.delegate setBadgeNumber:0 index:0];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testAction:(id)sender {
 //请求活动示例
    /**
  [[BaseService shareNetworkService] requestActivityParameters:nil DataSouce:self RequestType:Request_Activity_hostlist Block:^(__weak id data, NSError *error) {
      
      WQActivityModel *model=data;
  }];
    **/
//    NSString *longitude=@"116.269";
//    NSString *latitude=@"39.83612";
//    
////    NSString *scode=[NSString stringWithFormat:@"%@%@",longitude,latitude];
//
////    NSDictionary *dir=@{@"scode": scode,@"longitude":longitude,@"latitude":latitude};
    

}
#pragma mark-ServiceDataSource
@end
