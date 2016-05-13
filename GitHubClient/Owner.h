//
//  Owner.h
//  NoModel
//
//  Created by QC.L on 16/05/10
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Owner : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *organizations_url;

@property (nonatomic, copy) NSString *received_events_url;

@property (nonatomic, copy) NSString *following_url;

@property (nonatomic, copy) NSString *login;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *subscriptions_url;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *repos_url;

@property (nonatomic, copy) NSString *html_url;

@property (nonatomic, copy) NSString *events_url;

@property (nonatomic, assign) BOOL site_admin;

@property (nonatomic, copy) NSString *starred_url;

@property (nonatomic, copy) NSString *gists_url;

@property (nonatomic, copy) NSString *gravatar_id;

@property (nonatomic, copy) NSString *followers_url;

@end