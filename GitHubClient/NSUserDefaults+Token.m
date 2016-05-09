//
//  NSUserDefaults+Token.m
//  GitHubClient
//
//  Created by QC.L on 16/5/5.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "NSUserDefaults+Token.h"

static NSString * const kGitHubTokenKey = @"kGitHubTokenKey";

@implementation NSUserDefaults (Token)

- (void)setToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token
                                              forKey:kGitHubTokenKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)getToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kGitHubTokenKey];
}

- (void)clearToken {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kGitHubTokenKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
