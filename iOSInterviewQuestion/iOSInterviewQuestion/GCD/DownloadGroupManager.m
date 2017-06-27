//
//  DownloadGroupManager.m
//  iOSInterviewQuestion
//
//  Created by 宋志明 on 17/6/26.
//  Copyright © 2017年 宋志明. All rights reserved.
//

#import "DownloadGroupManager.h"
#import <YYWebImage/YYWebImageManager.h>

@interface DownloadGroupManager()
{
    dispatch_queue_t _processingQueue;
}

@end

@implementation DownloadGroupManager

+ (instancetype)shareManager
{
    static id sharemanager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharemanager = [[DownloadGroupManager alloc]init];
    });
    return sharemanager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _processingQueue = dispatch_queue_create("com.iOSInterviewQuestion.processing", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)downloadImagesUrl:(NSArray *)imagesUrls
          downloadSuccess:(downloadSuccess)downloadSuccess;
{
    YYWebImageManager *manager = [YYWebImageManager sharedManager];
    NSMutableArray *array = [NSMutableArray array];
    dispatch_group_t imageDownloadGroup = dispatch_group_create();
    [imagesUrls enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *imageURL = obj;
        if (imageURL) {
            UIImage *imageFromMemory = [manager.cache getImageForKey:[manager cacheKeyForURL:[NSURL URLWithString:imageURL]] withType:YYImageCacheTypeAll];
            if (imageFromMemory) {
                [array addObject:imageFromMemory];
                return;
            }
            dispatch_group_enter(imageDownloadGroup);
            dispatch_async(_processingQueue, ^{
                [[YYWebImageManager sharedManager] requestImageWithURL:[NSURL URLWithString:imageURL] options:kNilOptions progress:nil transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
                    [array addObject:image];
                    dispatch_group_leave(imageDownloadGroup);
                }];
            });
        }
    }];
    dispatch_group_notify(imageDownloadGroup, _processingQueue, ^{
        if (downloadSuccess) {
            downloadSuccess(array);
        }
    });
}



@end
