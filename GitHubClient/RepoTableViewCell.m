//
//  RepoTableViewCell.m
//  GitHubClient
//
//  Created by QC.L on 16/5/9.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "RepoTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>


static NSString * const kRepoName = @"name";
static NSString * const kDescription = @"description";
static NSString * const kOwner = @"owner";
static NSString * const kAvatarUrl = @"avatar_url";

@interface RepoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatar_url;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *detil;

@end

@implementation RepoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)passModelWithDictionary:(NSDictionary *)dictionary {
    self.name.text = dictionary[kRepoName];
    self.detil.text = dictionary[kDescription];
    [self.avatar_url sd_setImageWithURL:[NSURL URLWithString:dictionary[kOwner][kAvatarUrl]]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
