//
//  TestView.m
//  DrawRectDemo
//
//  Created by 吴洋 on 16/4/5.
//  Copyright © 2016年 吴洋. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createBaseView];
        
    }
    
    return self;
}

- (void)createBaseView
{
    self.backgroundColor = [UIColor clearColor];
  
// cornerRadius绘制圆角
//    self.layer.cornerRadius = 20;
}

// CG绘制圆角

- (void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    // 简便起见，这里把圆角半径设置为长和宽平均值的1/10
    CGFloat radius = (width + height) * 0.05;
    // 获取CGContext，注意UIKit里用的是一个专门的函数
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 移动到初始点
    CGContextMoveToPoint(context, radius, 0);
    // 绘制第1条线和第1个1/4圆弧
    CGContextAddLineToPoint(context, width - radius, 0);
    CGContextAddArc(context, width - radius, radius, radius, -0.5 * M_PI, 0.0, 0);
    // 绘制第2条线和第2个1/4圆弧
    CGContextAddLineToPoint(context, width, height - radius);
    CGContextAddArc(context, width - radius, height - radius, radius, 0.0, 0.5 * M_PI, 0);
    // 绘制第3条线和第3个1/4圆弧
    CGContextAddLineToPoint(context, radius, height);
    CGContextAddArc(context, radius, height - radius, radius, 0.5 * M_PI, M_PI, 0);
    // 绘制第4条线和第4个1/4圆弧
    CGContextAddLineToPoint(context, 0, radius);
    CGContextAddArc(context, radius, radius, radius, M_PI, 1.5 * M_PI, 0);
    // 闭合路径
    CGContextClosePath(context);
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    // 填充半透明粉红色
    CGContextSetRGBFillColor(context, 255.0, 0.0, 0.0, 1);
    CGContextDrawPath(context, kCGPathFill|kCGPathFillStroke);
}

// UIBezierPath绘制圆角

//- (void)drawRect:(CGRect)rect
//{
//    CGFloat width = rect.size.width;
//    CGFloat height = rect.size.height;
//    // 简便起见，这里把圆角半径设置为长和宽平均值的1/10
//    CGFloat radius = (width + height) * 0.05;
//    
//    UIBezierPath *p = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
//    [p stroke];
//}

@end
