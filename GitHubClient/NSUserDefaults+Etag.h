//
//  NSUserDefaults+Etag.h
//  GitHubClient
//
//  Created by QC.L on 16/5/5.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Etag)

- (void)setEtagCacheWithURL:(NSString *)url
                  etag:(NSString *)etag;

- (NSString *)getEtagCacheWithUrl:(NSString *)url;

- (void)removeAllEtagCache;


@end
