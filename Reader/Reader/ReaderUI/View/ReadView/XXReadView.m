//
//  XXReadView.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "XXReadView.h"

@implementation XXReadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

/**
 绘制文本展示
 */
- (void)drawRect:(CGRect)rect {
    if (!_frameRef) {
        return;
    }
    //获取上下文,也就是当前画布
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(ctx, CGAffineTransformIdentity);
    //坐标系平移
    CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
    //坐标系X,Y缩放
    CGContextScaleCTM(ctx, 1.0, -1.0);
    //绘制文字
    CTFrameDraw(_frameRef, ctx);
}

#pragma mark - Privite Method

- (void)setFrameRef:(CTFrameRef)frameRef {
    if (_frameRef != frameRef) {
        if (_frameRef) {
            CFRelease(_frameRef);
            _frameRef = nil;
        }
        _frameRef = frameRef;
    }
}
- (void)dealloc {
    if (_frameRef) {
        CFRelease(_frameRef);
        _frameRef = nil;
    }
}
@end
