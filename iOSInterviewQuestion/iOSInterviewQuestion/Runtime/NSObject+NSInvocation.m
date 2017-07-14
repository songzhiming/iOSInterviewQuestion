//
//  NSObject+NSInvocation.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/13.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "NSObject+NSInvocation.h"

@implementation NSObject (NSInvocation)

// Type EnRcoding
// https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100
+ (id)performSelector:(SEL)aSelector withObjects:(NSArray *)array
{
    
    NSMethodSignature *sign = [[self class] instanceMethodSignatureForSelector:aSelector];
    if (sign == nil) {
        //传入的方法不存在 就抛异常
        NSString*info = [NSString stringWithFormat:@"-[%@ %@]:unrecognized selector sent to instance",[self class],NSStringFromSelector(aSelector)];
        @throw [[NSException alloc] initWithName:@"方法没有" reason:info userInfo:nil];
        return nil;
    }
    NSInvocation *vocation = [NSInvocation invocationWithMethodSignature:sign];
    vocation.target = self;
    vocation.selector = aSelector;
    
    //5、设置参数
    /*
     当前如果直接遍历参数数组来设置参数
     如果参数数组元素多余参数个数，那么就会报错
     */
    NSInteger arguments = sign.numberOfArguments-2;
    NSUInteger objectsCount = array.count;
    NSInteger count = MIN(arguments, objectsCount);
    for (int i = 0; i < count; i++) {
        NSObject *object = array[i];
        if ([object isKindOfClass:[NSNull class]]) {
            object = nil;
        }
        [vocation setArgument:&object atIndex:i+2];
    }
    [vocation invoke];
    id res= nil;
    //7、获取返回值
    //判断当前方法是否有返回值
        NSLog(@"methodReturnType = %s",sign.methodReturnType);
        NSLog(@"methodReturnTypeLength = %zd",sign.methodReturnLength);
    if (sign.methodReturnLength!=0) {
        //getReturnValue获取返回值
        [vocation getReturnValue:&res];
    }
    return res;
}


@end
