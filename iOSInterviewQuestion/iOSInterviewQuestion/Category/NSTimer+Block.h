//
//  NSTimer+Block.h
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/6.
//  Copyright © 2017年 宋志明. All rights reserved.
//

// http://blog.lessfun.com/blog/2016/08/05/reliable-timer-in-ios/

#import <Foundation/Foundation.h>

@interface NSTimer (Block)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(NSTimer *))block repeats:(BOOL)repeats;

@end
