//
//  XXReadParser.m
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import "XXReadParser.h"

@implementation XXReadParser

+ (CTFrameRef)parserContent:(NSString *)content config:(XXReadConfig *)parser bouds:(CGRect)bounds {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content];
    NSDictionary *attribute = [self parserAttribute:parser];
    [attributedString setAttributes:attribute range:NSMakeRange(0, content.length)];
    CTFramesetterRef setterRef = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributedString);
    CGPathRef pathRef = CGPathCreateWithRect(bounds, NULL);
    CTFrameRef frameRef = CTFramesetterCreateFrame(setterRef, CFRangeMake(0, 0), pathRef, NULL);
    CFRelease(setterRef);
    CFRelease(pathRef);
    return frameRef;
}

+ (NSDictionary *)parserAttribute:(XXReadConfig *)config {
    //设置段落风格
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //字体行间距
    paragraphStyle.lineSpacing = [XXReadConfig shareInstance].lineSpace;
    //文本对齐方式
    paragraphStyle.alignment = NSTextAlignmentJustified;//两端缩进
    //首行缩进
    UIFont *contentFont = [UIFont systemFontOfSize:[XXReadConfig shareInstance].fontSize];
    //    paragraphStyle.firstLineHeadIndent = contentFont.pointSize * 2;
    //行位缩进
    paragraphStyle.tailIndent = 0.0f;
    NSDictionary *dict = @{NSForegroundColorAttributeName:[XXReadConfig shareInstance].fontColor,
                           NSFontAttributeName:contentFont,
                           NSParagraphStyleAttributeName:paragraphStyle};
    return dict;
}

@end
