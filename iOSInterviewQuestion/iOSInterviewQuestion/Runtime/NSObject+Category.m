//
//  NSObject+Category.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/20.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/message.h>

@implementation NSObject (Category)


- (void)setStr:(NSString *)str
{
    objc_setAssociatedObject(self, @selector(str), str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSString *)str
{
    return objc_getAssociatedObject(self, _cmd);
}


@end
