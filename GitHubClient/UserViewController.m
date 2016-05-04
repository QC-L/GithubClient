//
//  UserViewController.m
//  GitHubClient
//
//  Created by QC.L on 16/5/3.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "UserViewController.h"
#import "QCNetworkManager.h"
#import "QCRequest.h"

@interface UserViewController () <QCNetworkResult>
@property (nonatomic, strong) QCNetworkManager *manager;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *url = [NSString stringWithFormat:@"https://api.github.com/user?access_token=%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"]];
    
    _manager = [QCNetworkManager defaultManager];
    _manager.delegate = self;
    QCRequest *request = [[QCRequest alloc] init];
    request.urlString = url;
    [_manager getRequest:request];

}

- (void)requestedSuccess:(id)responseObject {
    NSLog(@"%@", responseObject);
}

- (void)requestedError:(NSError *)error {
    NSLog(@"%@", error);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
