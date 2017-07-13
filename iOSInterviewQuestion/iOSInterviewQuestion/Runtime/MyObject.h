//
//  MyObject.h
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/26.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyObject : NSObject<NSCopying,NSMutableCopying>
@property (nonatomic,copy) NSString *text;

@end
