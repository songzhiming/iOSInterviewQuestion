//
//  MyObject.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/26.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "MyObject.h"

@interface MyObject()
{
    NSString *aaa;
}

@end

@implementation MyObject

- (id)copyWithZone:(nullable NSZone *)zone
{
    MyObject *obj = [[self class]allocWithZone:zone];
    obj.text = self.text;
    obj->aaa = aaa;
    return obj;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone
{
    MyObject *obj = [[self class]allocWithZone:zone];
    obj.text = self.text;
    obj->aaa = aaa;
    return obj;
}

@end
