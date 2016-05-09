//
//  NSUserDefaults+Etag.m
//  GitHubClient
//
//  Created by QC.L on 16/5/5.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "NSUserDefaults+Etag.h"
#import "NSString+MD5.h"

static NSString * const kEtagKey = @"kEtagKey";

@implementation NSUserDefaults (Etag)

- (void)setEtagCacheWithURL:(NSString *)url
                       etag:(NSString *)etag {
    NSMutableDictionary *dic = [[[NSUserDefaults standardUserDefaults] objectForKey:kEtagKey] mutableCopy];
    if (!dic) {
        dic = [NSMutableDictionary dictionary];
    }
    NSString *md5String = [url stringWithMD5];
    dic[md5String] = etag;
    [self setObject:dic forKey:kEtagKey];
    [self synchronize];
}

- (NSString *)getEtagCacheWithUrl:(NSString *)url {
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:kEtagKey];
    return dic[[url stringWithMD5]];
}

- (void)removeAllEtagCache {
    [self removeObjectForKey:kEtagKey];
}

@end
