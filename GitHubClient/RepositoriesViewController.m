//
//  RepositoriesViewController.m
//  GitHubClient
//
//  Created by QC.L on 16/5/9.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "RepositoriesViewController.h"
#import "QCNetworking.h"
#import "GitHubApiManager.h"
#import "RepoTableViewCell.h"
#import "RepoModel.h"
#import <MJExtension/MJExtension.h>
#import "RepoDetailViewController.h"

static NSString * const kRepoTableViewCell = @"repoCell";

@interface RepositoriesViewController () <UITableViewDataSource, UITableViewDelegate, QCNetworkResult>
@property (weak, nonatomic) IBOutlet UITableView *repoTableView;

@property (nonatomic, strong) QCNetworkManager *manager;

@property (nonatomic, strong) NSArray *reposArray;

@end

@implementation RepositoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Repositories";
    [self.repoTableView registerNib:[UINib nibWithNibName:@"RepoTableViewCell" bundle:nil] forCellReuseIdentifier:kRepoTableViewCell];
    [self handleRequestData];
    
}



- (void)handleRequestData {
    QCRequest *request = [[QCRequest alloc] init];
    request.urlString = [GitHubApiManager getGitHubReposApi];
    _manager = [QCNetworkManager defaultManager];
    _manager.delegate = self;
    [_manager getRequest:request];
} 

- (void)requestedSuccess:(id)responseObject {
    
    [RepoModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"Description" : @"description"};
    }];

    self.reposArray = [RepoModel mj_objectArrayWithKeyValuesArray:responseObject];
    [self.repoTableView reloadData];

}

- (void)requestedError:(NSError *)error {
    
}

#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 10 + 30 + 15;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoDetailViewController *repoDetail = [RepoDetailViewController new];
    repoDetail.repoDetailModel = self.reposArray[indexPath.row];
    
    [self.navigationController pushViewController:repoDetail animated:YES];
}

#pragma mark - tableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRepoTableViewCell forIndexPath:indexPath];
    [cell passModelWithDictionary:[self.reposArray[indexPath.row] mj_keyValues]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.reposArray.count;
}

#pragma mark - statusBar
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
