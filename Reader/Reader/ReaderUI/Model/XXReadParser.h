//
//  XXReadParser.h
//  Reader
//
//  Created by 薛佳妮 on 2018/7/23.
//  Copyright © 2018年 jiani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XXReadConfig.h"

@interface XXReadParser : NSObject

+ (CTFrameRef)parserContent:(NSString *)content config:(XXReadConfig *)parser bouds:(CGRect)bounds;
+ (NSDictionary *)parserAttribute:(XXReadConfig *)config;

@end
