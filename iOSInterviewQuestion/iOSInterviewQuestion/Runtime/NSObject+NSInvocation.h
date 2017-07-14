//
//  NSObject+NSInvocation.h
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/7/13.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSInvocation)


+ (id)performSelector:(SEL)aSelector withObjects:(NSArray *)array;

@end
