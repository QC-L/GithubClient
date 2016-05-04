//
//  GitHubAPI.m
//  GitHubClient
//
//  Created by QC.L on 16/5/4.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "GitHubOAuthHelper.h"
#import <UIKit/UIKit.h>

const NSString *kOpenUrl = @"https://github.com/login/oauth/authorize?";

@implementation GitHubOAuthHelper

+ (NSURL *)getGitHubOpenUrl {

    NSString *openUrlPram = [NSString stringWithFormat:@"client_id=%@&scope=%@", kClientId, kScope];
    NSString *openUrl = [NSString stringWithFormat:@"%@%@", kOpenUrl,openUrlPram];
    return [NSURL URLWithString:openUrl];
}

+ (void)gitHubOAuthOpenUrl {
    [[UIApplication sharedApplication] openURL:[[self class] getGitHubOpenUrl]];
}

@end
