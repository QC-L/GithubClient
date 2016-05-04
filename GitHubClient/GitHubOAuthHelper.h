//
//  GitHubAPI.h
//  GitHubClient
//
//  Created by QC.L on 16/5/4.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

const NSString *kClientId = @"f2c0abf76bbb876600a8";
const NSString *kScope = @"user,public_repo";
const NSString *kClientSecret = @"c8b566ff62fa44ca5b18131b85d3997599dba8a4";

@interface GitHubOAuthHelper : NSObject

+ (void)gitHubOAuthOpenUrl;

@end
