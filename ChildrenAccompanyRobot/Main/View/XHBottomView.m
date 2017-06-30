//
//  XHBottomView.m
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/6/21.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import "XHBottomView.h"
#import "XHBottomBtn.h"

@interface XHBottomView()

@property (nonatomic, weak) XHBottomBtn *selectBtn;

@end

@implementation XHBottomView


- (void)addBottonWithImage:(UIImage *)norImg andSelectImage:(UIImage *)selImg
{
    XHBottomBtn *btn = [XHBottomBtn buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:norImg forState:UIControlStateNormal];
    [btn setImage:selImg forState:UIControlStateSelected];
    
    [self addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClick:(XHBottomBtn *)sender
{
    if (sender.tag != 1) {
        self.selectBtn.selected = NO;
        sender.selected = YES;
        self.selectBtn = sender;
        
    }else {
        
    }
    
//    self.selectBtn.selected = NO;
//    sender.selected = YES;
//    self.selectBtn = sender;
    
    if ([self.delegate respondsToSelector:@selector(bottomView:didSelectIndex:)]) {
        [self.delegate bottomView:self didSelectIndex:sender.tag];
    }
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置宽高
    CGFloat btnW = self.width / self.subviews.count;
    CGFloat btnH = self.height;
    
    
    CGFloat btnY = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof XHBottomBtn * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat btnX = idx * btnW;
        
        obj.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        obj.tag = idx;
        
        if (idx == 0) {
            [self btnClick:obj];
        }
        
    }];
    
    
}


@end
