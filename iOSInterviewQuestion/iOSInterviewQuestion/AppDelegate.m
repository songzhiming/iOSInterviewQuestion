//
//  AppDelegate.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/20.
//  Copyright © 2017年 宋志明. All rights reserved.
//

typedef struct HHHStruct
{
    int a;
    int b;
}MyStruct;

#import "AppDelegate.h"
#import "InterviewQuestionViewController.h"
#import "MyObject.h"
#import "NSTimer+Block.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#define TLog(prefix,Obj) {NSLog(@"变量内存地址：%p, 变量值：%p, 指向对象值：%@, --> %@",&Obj,Obj,Obj,prefix);}

void UncaughtExceptionHandler(NSException *exception){
    // 可以通过exception对象获取一些崩溃信息，我们就是通过这些崩溃信息来进行解析的，例如下面的symbols数组就是我们的崩溃堆栈。
    NSArray *symbols = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSLog(@"symbols---%@",symbols);
    NSLog(@"reason----%@",reason);
    NSLog(@"name------%@",name);
}

- (void)NSInvocationWithString:(NSString *)string withNum:(NSNumber *)number withArray:(NSArray *)array withValue:(NSValue *)value{
    [NSTimer scheduledTimerWithTimeInterval:0.1 block:^(NSTimer *timer) {
        
    } repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
    }];
//    UIScrollView 
    
    MyStruct struceBack;
    [value getValue:&struceBack];
    
    NSLog(@"%@, %@, %@, %d", string, number, array[0],struceBack.a);
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [NSTimer scheduledTimerWithTimeInterval:0.1 block:^(NSTimer *timer) {
        
    } repeats:YES];
    
    
    NSArray *a = @[@(1),@(2),@(3),@(4),@(5)];
    int ptr = (int)(&a + 1);
    NSLog(@"---%d",(ptr + 1));
    
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    
    MyStruct mystruct = {10,20};
    NSValue *value = [NSValue valueWithBytes:&mystruct objCType:@encode(MyStruct)];
    NSArray *array = @[@(1),@(2),value];
    [self performSelector:@selector(testStruct:) withObject:array];
    
//    [self performSelector:@selector(test) withObject:nil];
    
    
    NSArray *nameArray = @[@"Jim", @"Tom", @"David"];
    NSArray *copyArray = [nameArray copy];
    NSMutableArray *mutableCopyArray = [nameArray mutableCopy];
    [mutableCopyArray addObject:@"Sam"];

    
    MyObject *obj = [[MyObject alloc]init];
    obj.text = @"my-object";
    TLog(@"obj-", obj);
    
    __weak MyObject *weakObj = obj;
    TLog(@"weakObj", weakObj);
    
    void(^testBlock)() = ^(){
        TLog(@"weakObj - block", weakObj);
    };
    testBlock();
    obj = nil;
    testBlock();
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    InterviewQuestionViewController *vc = [[InterviewQuestionViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
//    NSArray *a = [self tasksRunning:@[@(0),@(5),@(2)] endTasks:@[@(4),@(7),@(8)] times:@[@(1),@(9),@(4),@(3)]];
//    NSLog(@"A===%@",a);
    return YES;
}
- (void)testStruct:(NSArray *)array
{
    MyStruct struceBack;
    [array[2] getValue:&struceBack];

    NSLog(@"array---%d",struceBack.a);
//    NSRunLoopCommonModes
//NSDefaultRunLoopMode
//    UITrackingRunLoopMode
    NSLog(@"");
}



- (NSArray<NSNumber *> *)tasksRunning:(NSArray<NSNumber *> *)startasks
                             endTasks:(NSArray *)endTasks
                                times:(NSArray<NSNumber *> *)times
{
    NSMutableArray *aa = [NSMutableArray array];
    for (NSNumber *time in times) {
        int now = time.intValue;
        int j = 0;
        for (int i = 0; i < startasks.count; i++) {
            int start = [startasks[i] intValue];
            int end = [endTasks[i]intValue];
            if (start <= now && now< end) {
                j++;
            }
        }
        [aa addObject:@(j)];
    }
    return aa;
}







- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
