//
//  MyTabBarViewController.m
//  SinaTabBar
//
//  Created by liicon on 2017/5/25.
//  Copyright © 2017年 max. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "MyTabbar.h"
#import "homeViewController.h"
#import "MessageViewController.h"
#import "ArticleViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"


@interface MyTabBarViewController ()<MyTabbarDelegate>

@property(nonatomic, strong) NSString *name;

@end

@implementation MyTabBarViewController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildVc];
    
    MyTabbar *tabBar = [[MyTabbar alloc] init];
    tabBar.myDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    // Do any additional setup after loading the view.
}

- (void)setUpAllChildVc{
    homeViewController *honmeVc = [[homeViewController alloc] init];
    [self setUpNaviVc:honmeVc normalImage:@"tabbar_home" selectImage:@"tabbar_home_selected" title:@"微博"];
    MessageViewController *messageVc = [[MessageViewController alloc] init];
    [self setUpNaviVc:messageVc normalImage:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected" title:@"消息"];
    FindViewController *findVc = [[FindViewController alloc] init];
    [self setUpNaviVc:findVc normalImage:@"tabbar_discover" selectImage:@"tabbar_discover_selected" title:@"发现"];
    MineViewController *mineVc = [[MineViewController alloc] init];
    [self setUpNaviVc:mineVc normalImage:@"tabbar_profile" selectImage:@"tabbar_profile_selected" title:@"我"];
    
}

- (void)setUpNaviVc:(UIViewController *)rootVc normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage title:(NSString *)title{
    UINavigationController *Navi = [[UINavigationController alloc] initWithRootViewController:rootVc];
    
    //设置图片原始
    UIImage *image = [UIImage imageNamed:normalImage];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    rootVc.tabBarItem.image = image;
    
    UIImage *selImage = [UIImage imageNamed:selectImage];
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    rootVc.tabBarItem.selectedImage = selImage;
    
    rootVc.tabBarItem.title = title;
    [self addChildViewController:Navi];
}

#pragma -mark MyTabbarDelegate
- (void)tabBarBtnClick:(UIButton *)button{
    ArticleViewController *textVc = [[ArticleViewController alloc] init];
    
    [self presentViewController:textVc animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
