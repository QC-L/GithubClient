//
//  GitHubApiManager.h
//  GitHubClient
//
//  Created by QC.L on 16/5/10.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GitHubApiManager : NSObject

/**
 *  获取仓库列表API
 *
 *  @return
 */
+ (NSString *)getGitHubReposApi;
/**
 *  获取仓库详情
 *
 *  @param repoName 仓库名
 *
 *  @return 
 */
+ (NSString *)getGitHubRepoDetailsApi:(NSString *)repoName;

@end
