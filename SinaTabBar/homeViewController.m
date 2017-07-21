//
//  homeViewController.m
//  SinaTabBar
//
//  Created by liicon on 2017/5/25.
//  Copyright © 2017年 max. All rights reserved.
//

#import "homeViewController.h"
#import "Page1ViewController.h"

@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    Page1ViewController *pageVc = [[Page1ViewController alloc] init];
    pageVc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:pageVc animated:YES];
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
