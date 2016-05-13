//
//  RepoDetailViewController.m
//  GitHubClient
//
//  Created by QC.L on 16/5/12.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "RepoDetailViewController.h"
#import "RepoModel.h"

@interface RepoDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *repoDetailTableView;
@end

@implementation RepoDetailViewController


#pragma mark - ViewController Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createBarButtonItems];
    [self.repoDetailTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self addTableViewHeaderView];

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)addTableViewHeaderView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 300)];
    view.backgroundColor = [UIColor blackColor];
    self.repoDetailTableView.tableHeaderView = view;
                                                            
    
}

- (void)createBarButtonItems {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backReposList)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"repo_detail_share"] style:UIBarButtonItemStylePlain target:self action:@selector(shareRepo)];
}

- (void)shareRepo {
    NSLog(@"分享");
}

- (void)backReposList {
    NSLog(@"返回");
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
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
