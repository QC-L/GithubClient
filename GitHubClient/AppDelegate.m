//
//  AppDelegate.m
//  GitHubClient
//
//  Created by 臧其龙 on 16/4/30.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "AppDelegate.h"
#import "QCNetworkManager.h"
#import "UserViewController.h"
#import "QCRequest.h"
#import "GitHubOAuthHelper.h"

@interface AppDelegate () <QCNetworkResult>
@property (nonatomic, strong) QCNetworkManager *manager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options {
    
    NSDictionary *dictionary = @{@"client_id": kClientId,
        @"client_secret": kClientSecret,
                          @"code": [url.resourceSpecifier componentsSeparatedByString:@"="][1]};
    NSDictionary *allHttpHeaderFields = @{@"Accept": @"application/json"};
    
    _manager = [QCNetworkManager defaultManager];
    _manager.delegate = self;
    
    QCRequest *request = [[QCRequest alloc] init];
    request.urlString = @"https://github.com/login/oauth/access_token";
    request.parameters = dictionary;
    request.allHttpHeaderFields = allHttpHeaderFields;
    
    [_manager postRequest:request];
    
    
    
    
    
    return YES;
}

- (void)requestedSuccess:(id)responseObject {

    NSString *token = responseObject[@"access_token"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:token forKey:@"access_token"];
    
    [defaults synchronize];

    
    UserViewController *vc = [[UserViewController alloc] initWithNibName:@"UserViewController" bundle:nil];
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    [nav pushViewController:vc animated:YES];
    
    
}

- (void)requestedError:(NSError *)error {
    NSLog(@"%@", error);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
