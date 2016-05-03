//
//  ViewController.m
//  GitHubClient
//
//  Created by 臧其龙 on 16/4/30.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)openApplicationOAuth2:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"https://github.com/login/oauth/authorize?client_id=f2c0abf76bbb876600a8&scope=user,public_repo"];
    
    [[UIApplication sharedApplication] openURL:url];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
