//
//  MyTabbar.h
//  SinaTabBar
//
//  Created by liicon on 2017/7/21.
//  Copyright © 2017年 max. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTabbarDelegate <NSObject>
@optional
- (void)tabBarBtnClick:(UIButton *)button;

@end

@interface MyTabbar : UITabBar

@property(nonatomic,weak) id<MyTabbarDelegate>myDelegate;

@end
