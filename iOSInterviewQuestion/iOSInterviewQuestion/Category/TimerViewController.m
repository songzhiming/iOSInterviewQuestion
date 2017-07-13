//
//  TimerViewController.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/6.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_semaphore_t semaphore1 = dispatch_semaphore_create(0);
    dispatch_semaphore_t semaphore2 = dispatch_semaphore_create(0);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"thread 2");
            sleep(2);
            dispatch_semaphore_signal(semaphore2);
        });
        dispatch_semaphore_wait(semaphore2, DISPATCH_TIME_FOREVER);
        NSLog(@"thread 1");
        sleep(2);
        dispatch_semaphore_signal(semaphore1);
    });
    dispatch_semaphore_wait(semaphore1, DISPATCH_TIME_FOREVER);
    NSLog(@"main thread");
    
    
//    self.title = @"Timer";
//    NSLog(@"%s---runloop===%@",__func__,[NSRunLoop currentRunLoop]);
//    [NSThread detachNewThreadSelector:@selector(testTimerSheduleRunloop) toTarget:self withObject:nil];
    // Do any additional setup after loading the view from its nib.
}


- (void)testTimerSheduleRunloop
{
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:1] interval:0.1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]runUntilDate:[NSDate distantFuture]];
    NSLog(@"%s---runloop===%@",__func__,[NSRunLoop currentRunLoop]);
}

- (void)timerAction
{
    NSLog(@"%s---runloop===%@",__func__,[NSRunLoop currentRunLoop]);
    NSLog(@"timeraction");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
