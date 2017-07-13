//
//  BinaryTree.h
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/7.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinaryTreeNode;
@interface BinaryTree : NSObject

+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values;

+ (BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode;

+ (BinaryTreeNode *)invertBinaryTreeWithoutRecursion:(BinaryTreeNode *)rootNode;

@end
