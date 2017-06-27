//
//  InterviewQuestionViewController.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/20.
//  Copyright © 2017年 宋志明. All rights reserved.
//



#import "InterviewQuestionViewController.h"

@interface InterviewQuestionViewController ()

@property (nonatomic,strong) NSArray *datasource;

@end

@implementation InterviewQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDelegate &&  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.datasource[indexPath.row][@"name"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *str = self.datasource[indexPath.row][@"vc"];
    UIViewController *vc = (UIViewController *)[[NSClassFromString(str) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
//    NameCardInfoViewController *vc = [[NameCardInfoViewController alloc]init];
//    vc.model = self.datasource[indexPath.row];
//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark setter && getter
- (NSArray *)datasource
{
    if (!_datasource) {
        _datasource = @[@{@"name":@"algorithm",@"vc":@""},
                        @{@"name":@"Runtime",@"vc":@"RuntimeViewController"}];
    }
    return _datasource;
}


@end
