//
//  TestKVO.h
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/6.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestKVO : NSObject

@property (nonatomic,copy,readonly) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
