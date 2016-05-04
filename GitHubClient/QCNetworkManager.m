//
//  QCNetworkManager.m
//  GitHubClient
//
//  Created by QC.L on 16/5/3.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "QCNetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "QCRequest.h"

@interface QCNetworkManager ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation QCNetworkManager

+ (QCNetworkManager *)defaultManager {
    static QCNetworkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[QCNetworkManager alloc] init];
    });
    return manager;
}

- (void)getRequest:(QCRequest *)request {
    
    _manager = [self getManager];
    
    for (id key in request.allHttpHeaderFields.allKeys) {
        [_manager.requestSerializer setValue:request.allHttpHeaderFields[key] forHTTPHeaderField:key];
    }
    
    [_manager GET:request.urlString parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestedSuccess:)] && responseObject) {
            [self.delegate requestedSuccess:responseObject];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestedError:)]) {
            [self.delegate requestedError:error];
        }
    }];
}

- (void)postRequest:(QCRequest *)request {
    _manager = [self getManager];
    
    for (id key in request.allHttpHeaderFields.allKeys) {
        [_manager.requestSerializer setValue:request.allHttpHeaderFields[key] forHTTPHeaderField:key];
    }
    
    [_manager POST:request.urlString parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestedSuccess:)] && responseObject) {
            [self.delegate requestedSuccess:responseObject];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestedError:)]) {
            [self.delegate requestedError:error];
        }
        
    }];
    
}

- (AFHTTPSessionManager *)getManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    return manager;
}

@end
