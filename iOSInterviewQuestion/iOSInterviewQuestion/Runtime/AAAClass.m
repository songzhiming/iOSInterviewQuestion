//
//  AAAClass.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/21.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "AAAClass.h"

@implementation AAAClass

-(void)doSomethingElse
{
    NSLog(@"doSomething was called on %@", [self class]);
}

@end
