//
//  DownloadGroupManager.h
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/26.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^downloadSuccess)(NSArray *array);

@interface DownloadGroupManager : NSObject

+ (instancetype)shareManager;

- (void)downloadImagesUrl:(NSArray *)imagesUrls
          downloadSuccess:(downloadSuccess)downloadSuccess;


@end
