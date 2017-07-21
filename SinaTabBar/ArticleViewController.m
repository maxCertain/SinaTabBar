//
//  ArticleViewController.m
//  SinaTabBar
//
//  Created by liicon on 2017/5/25.
//  Copyright © 2017年 max. All rights reserved.
//

#import "ArticleViewController.h"

@interface ArticleViewController ()

@property(nonatomic, strong) UIView *bottomView;
@property(nonatomic, strong) UIButton *closeBtn;

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBottomView];
    
    // Do any additional setup after loading the view.
}

- (void)setUpBottomView{
    
    self.bottomView = [[UIView alloc] init];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn = btn;
    [btn setImage:[UIImage imageNamed:@"toolbar_stop"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"toolbar_stop_highlighted"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchDown];
    [self.bottomView addSubview:btn];
    [self.view addSubview:self.bottomView];
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    line.tag = 1000;
    [self.bottomView addSubview:line];
    self.bottomView.backgroundColor = [UIColor lightTextColor];
}


- (void)closeBtnClick:(UIButton *)btn{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLayoutSubviews{
    self.bottomView.frame = CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44);
    
    self.closeBtn.frame = CGRectMake((CGRectGetWidth(self.bottomView.frame) - CGRectGetHeight(self.bottomView.frame))/2, 0, CGRectGetHeight(self.bottomView.frame), CGRectGetHeight(self.bottomView.frame));
    UIView *line = [self.bottomView viewWithTag:1000];
    line.frame = CGRectMake(0, 0, self.view.bounds.size.width, 0.4);
}

- (void)didReceiveMemoryWarning1 {
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
