//
//  BBBClass.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/21.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "BBBClass.h"
#import "AAAClass.h"

@implementation BBBClass


-(id)init
{
    if (self = [super init]) {
        aaaClass = [AAAClass new];
    }
    return self;
}

-(void)doSomething
{
    NSLog(@"doSomething was called on %@", [self class]);
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    NSLog(@"sel is %@", NSStringFromSelector(sel));
//    if(sel == @selector(setName:)){
//        class_addMethod([self class],sel,(IMP)dynamicMethodIMP,"v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    //如果代理对象能处理，则转接给代理对象
//    if ([proxyObj respondsToSelector:aSelector]) {
//        return proxyObj;
//    }
//    //不能处理进入转发流程
//    return nil;
//}

-(void)forwardInvocation:(NSInvocation *)invocation
{
    if (!aaaClass) {
        [self doesNotRecognizeSelector: [invocation selector]];
    }
    [invocation invokeWithTarget: aaaClass];
}

-(NSMethodSignature*)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    if (! signature) {
        //生成方法签名
        signature = [aaaClass methodSignatureForSelector:selector];
    }
    return signature;
}

@end
