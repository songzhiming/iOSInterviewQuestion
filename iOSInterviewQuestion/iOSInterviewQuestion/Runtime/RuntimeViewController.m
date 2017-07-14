//
//  RuntimeViewController.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/20.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "RuntimeViewController.h"
//#import "NSObject+Category.h"
//#import "BBBClass.h"
#import "NSObject+NSInvocation.h"
@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSObject *objc = [[NSObject alloc] init];
//    objc.str = @"11";
//    
//    NSLog(@"%@",objc.str);
//    id bClass = [BBBClass new];
//    [bClass performSelector:@selector(doSomething)];
//    [bClass performSelector:@selector(doSomethingElse)];
    [self doingNsvocation];
//    [self performSelector:@selector(testNsInvocation:content:) withObjects:@[@"1",@"2"]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doingNsvocation
{
    //NSInvocation;用来包装方法和对应的对象，它可以存储方法的名称，对应的对象，对应的参数,
    /*
     NSMethodSignature：签名：再创建NSMethodSignature的时候，必须传递一个签名对象，签名对象的作用：用于获取参数的个数和方法的返回值
     */
    //创建签名对象的时候不是使用NSMethodSignature这个类创建，而是方法属于谁就用谁来创建
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:@selector(testNsInvocation:content:)];
    NSMethodSignature *test = [[self class] instanceMethodSignatureForSelector:@selector(aaa)];
    if (signature) {
        NSInvocation *vocation = [NSInvocation invocationWithMethodSignature:signature];
        vocation.target = self;
        //invocation中的方法必须和签名中的方法一致。
        vocation.selector = @selector(testNsInvocation:content:);
        //注意：设置参数的索引时不能从0开始，因为0已经被self占用，1已经被_cmd占用
        NSString *str1 = @"hello";
        [vocation setArgument:&str1 atIndex:2];
        NSString *str2 = @"world";
        [vocation setArgument:&str2 atIndex:3];
        //2、调用NSInvocation对象的invoke方法
        //只要调用invocation的invoke方法，就代表需要执行NSInvocation对象中制定对象的指定方法，并且传递指定的参数
        [vocation invoke];
        id res= nil;
        //7、获取返回值
        //判断当前方法是否有返回值
        NSLog(@"methodReturnType = %s",signature.methodReturnType);
        NSLog(@"methodReturnTypeLength = %zd",signature.methodReturnLength);
        if (signature.methodReturnLength!=0) {
            //getReturnValue获取返回值
            [vocation getReturnValue:&res];
        }
        NSLog(@"res-%@",res);
    }
}


- (void)testNsInvocation:(NSString *)str1 content:(NSString *)str2
{
    NSLog(@"str1---%@",str1);
    NSLog(@"str2---%@",str2);
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
