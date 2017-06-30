//
//  XHBottomView.h
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/6/21.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHBottomView;

@protocol XHBottomViewDelegate <NSObject>

- (void)bottomView:(XHBottomView *)bottomView didSelectIndex:(NSUInteger)index;

@end

@interface XHBottomView : UIView

- (void)addBottonWithImage:(UIImage *)norImg andSelectImage:(UIImage *)selImg;

@property (nonatomic, weak) id<XHBottomViewDelegate>delegate;

@end
