//
//  BinaryTree.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/7.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "BinaryTree.h"
#import "BinaryTreeNode.h"
@implementation BinaryTree


+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values
{
    BinaryTreeNode *root = nil;
    for (NSInteger i = 0; i<values.count; i++) {
        NSInteger value = [values[i] integerValue];
        [[self class]addTreeNode:root value:value];
    }
    return root;
}

+ (BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode
{
    return nil;
}
//
+ (BinaryTreeNode *)invertBinaryTreeWithoutRecursion:(BinaryTreeNode *)rootNode
{
    return nil;
}



#pragma mark - Private SEL


+ (BinaryTreeNode *)addTreeNode:(BinaryTreeNode *)treeNode value:(NSInteger)value {
    //根节点不存在，创建节点
    if (!treeNode) {
        treeNode = [BinaryTreeNode new];
        treeNode.value = value;
        NSLog(@"node:%@", @(value));
    }
    else if (value <= treeNode.value) {
        NSLog(@"to left");
        //值小于根节点，则插入到左子树
        treeNode.leftNode = [[self class] addTreeNode:treeNode.leftNode value:value];
    }
    else {
        NSLog(@"to right");
        //值大于根节点，则插入到右子树
        treeNode.rightNode = [[self class] addTreeNode:treeNode.rightNode value:value];
    }
    return treeNode;
}


@end
