//
//  GCDTimer.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/6.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "GCDTimer.h"

@implementation GCDTimer
{
    BOOL _valid;
    __weak id _target;
    NSTimeInterval _interval;
    BOOL _repeats;
    SEL _selector;
    dispatch_semaphore_t _lock;
    dispatch_source_t _source;
}

- (instancetype)initWithFireTime:(NSTimeInterval)start
                        interval:(NSTimeInterval)interval
                          target:(id)target
                        selector:(SEL)selector
                         repeats:(BOOL)repeats
{
    self = [super init];
    _interval = interval;
    _selector = selector;
    _repeats = repeats;
    _valid = YES;
    __weak typeof(self) weakself = self;
    _lock = dispatch_semaphore_create(1);
    //dispatch源（dispatch source
    _source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_source, dispatch_time(DISPATCH_TIME_NOW, (start * NSEC_PER_SEC)), (interval * NSEC_PER_SEC), 0);
    dispatch_source_set_event_handler(_source, ^{[weakself fire];});//设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_resume(_source);//挂起
    return self;
}

- (void)fire
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);
    id target = _target;
    if (!_repeats || !target) {
        dispatch_semaphore_signal(_lock);
    }else{
        dispatch_semaphore_signal(_lock);
        [target performSelector:_selector withObject:self];
    }
#pragma clang diagnostic pop
}

- (void)invalidate
{
    dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);
    if (_valid) {
        dispatch_source_cancel(_source);
        _source = NULL;
        _target = nil;
        _valid = NO;
    }
    dispatch_semaphore_signal(_lock);
}
@end
