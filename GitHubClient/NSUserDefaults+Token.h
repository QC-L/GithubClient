//
//  NSUserDefaults+Token.h
//  GitHubClient
//
//  Created by QC.L on 16/5/5.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Token)

- (void)setToken:(NSString *)token;

- (NSString *)getToken;

- (void)clearToken;

@end
