//
//  BinaryTreeNode.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/7.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode


+ (instancetype)nodeWithValuse:(NSInteger)value
{
    BinaryTreeNode *node = [[super alloc]init];
    node.value = value;
    return node;
}

@end
