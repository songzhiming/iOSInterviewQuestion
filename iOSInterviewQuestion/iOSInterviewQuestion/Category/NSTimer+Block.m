//
//  NSTimer+Block.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/6.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "NSTimer+Block.h"

@implementation NSTimer (Block)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(NSTimer *))block repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(_block_timer:) userInfo:[block copy] repeats:repeats];
}


+ (void)_block_timer:(NSTimer *)timer
{
    void (^block)(NSTimer *) = timer.userInfo;
    if (block) {
        block(timer);
    }
}

@end
