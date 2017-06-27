//
//  RuntimeViewController.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/20.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "RuntimeViewController.h"
#import "NSObject+Category.h"
#import "BBBClass.h"
@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject *objc = [[NSObject alloc] init];
    objc.str = @"11";
    
    NSLog(@"%@",objc.str);
    id bClass = [BBBClass new];
    [bClass performSelector:@selector(doSomething)];
    [bClass performSelector:@selector(doSomethingElse)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
