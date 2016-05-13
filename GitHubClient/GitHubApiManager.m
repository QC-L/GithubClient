//
//  GitHubApiManager.m
//  GitHubClient
//
//  Created by QC.L on 16/5/10.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "GitHubApiManager.h"

static NSString * const kHostName = @"https://api.github.com";
static NSString * const kReposList = @"/users/QC-L/repos";

@implementation GitHubApiManager
+ (NSString *)getGitHubReposApi {
    return [kHostName stringByAppendingString:kReposList];
}

+ (NSString *)getGitHubRepoDetailsApi:(NSString *)repoName {
    return [[self getGitHubReposApi] stringByAppendingFormat:@"/%@", repoName];
}
@end
