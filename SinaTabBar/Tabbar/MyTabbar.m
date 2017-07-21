//
//  MyTabbar.m
//  SinaTabBar
//
//  Created by liicon on 2017/7/21.
//  Copyright © 2017年 max. All rights reserved.
//

#import "MyTabbar.h"
#import "SDAutoLayout.h"
#import "UIView+Extension.h"

@interface MyTabbar ()

@property(nonatomic, strong) UIButton *plusBtn;

@end

@implementation MyTabbar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        self.plusBtn.backgroundColor = [UIColor colorWithRed:235/250.0 green:137/250.0 blue:39/250.0 alpha:1];
        [self.plusBtn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchDown];
        self.plusBtn.layer.cornerRadius = 3;
        [self addSubview:self.plusBtn];
    }
    return self;
}

- (void)plusBtnClick:(UIButton *)btn{
    if (self.myDelegate != nil && [self.myDelegate respondsToSelector:@selector(tabBarBtnClick:)]) {
        [self.myDelegate tabBarBtnClick:btn];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //系统自带的按钮类型是UITabBarButton，找出这些类型的按钮，然后重新排布位置，空出中间的位置
    Class class = NSClassFromString(@"UITabBarButton");
    
    self.plusBtn.frame = CGRectMake((self.frame.size.width - 40)/2, 2, 40, 40);
    
    int btnIndex = 0;
    for (UIView *btn in self.subviews) {//遍历tabbar的子控件
        if ([btn isKindOfClass:class]) {//如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
            //每一个按钮的宽度==tabbar的五分之一
            btn.width = self.width / 5;
            
            btn.x = btn.width * btnIndex;
            
            btnIndex++;
            //如果是索引是2(从0开始的)，直接让索引++，目的就是让消息按钮的位置向右移动，空出来发布按钮的位置
            if (btnIndex == 2) {
                btnIndex++;
            }
        }
    }
    [self bringSubviewToFront:self.plusBtn];
}

//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.plusBtn];
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.plusBtn pointInside:newP withEvent:event]) {
            return self.plusBtn;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
            
            return [super hitTest:point withEvent:event];
        }
    }
    
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}


@end
