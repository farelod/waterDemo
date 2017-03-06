//
//  water.m
//  waterDemo
//
//  Created by mac on 15-3-6.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "water.h"


@implementation water

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        a = 1.5;
        b = 0;
        
        isAdd = NO;
        
        currentColor = [UIColor blueColor];
        currentLinePointY = 250;
        
        [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animate) userInfo:nil repeats:YES];
        
    }
    return self;
}

- (void)animate{
    if (isAdd) {
        a += 0.01;
    }else{
        a -= 0.01;
    }
    
    
    if (a <= 1.0) {
        isAdd = YES;
    }else if (a >= 1.5){
        isAdd = NO;
    }
    
    b += 0.1;
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 创建图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    //  设置线条宽度
    CGContextSetLineWidth(context, 1);
    //  设置线条颜色
    CGContextSetFillColorWithColor(context, [currentColor CGColor]);
    
    
    float y = currentLinePointY;
    // 起始点的坐标移至  (0,y)  作为起始点坐标
    CGPathMoveToPoint(path, NULL, 0, y);
    for (float x=0; x <= 320; x++) {
        y =a * sinf(x/180*M_PI + 4 *b/M_PI ) * 7 + currentLinePointY;
        //CGContextAddLineToPoint(context, x, y);
        CGPathAddLineToPoint(path, nil, x, y);
    }
    //  添加线到目标点
    CGPathAddLineToPoint(path, nil, 320, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, currentLinePointY);
    
    
    //  添加路线
    CGContextAddPath(context, path);
    
    CGContextFillPath(context);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    CGPathRelease(path);
}


@end
