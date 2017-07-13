//
//  TestKVO.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/6.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "TestKVO.h"

@implementation TestKVO

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

+ (BOOL)accessInstanceVariablesDirectly
{
    return NO;
}

@end
