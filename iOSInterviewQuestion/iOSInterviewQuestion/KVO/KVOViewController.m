//
//  KVOViewController.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/6.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "KVOViewController.h"
#import "TestKVO.h"

@interface KVOViewController ()

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"KVO";
    TestKVO *kvo = [[TestKVO alloc]initWithName:@"kvo"];
    NSLog(@"name---%@",kvo.name);
//    kvo.name = @"11";
//    [kvo setValue:@"11" forKey:@"name"];
    NSLog(@"name---%@",kvo.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
