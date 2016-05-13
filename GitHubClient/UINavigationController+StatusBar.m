//
//  UINavigationController+StatusBar.m
//  YZYRecordingVideo
//
//  Created by QC.L on 16/4/27.
//  Copyright © 2016年 QC.L. All rights reserved.
//

#import "UINavigationController+StatusBar.h"

@implementation UINavigationController (StatusBar)


- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

@end
