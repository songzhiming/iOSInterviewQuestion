//
//  BinaryTreeNode.h
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/7.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

@property (nonatomic,assign) NSInteger value;

@property (nonatomic,strong) BinaryTreeNode *leftNode;

@property (nonatomic,strong) BinaryTreeNode *rightNode;

+ (instancetype)nodeWithValuse:(NSInteger)value;

@end
