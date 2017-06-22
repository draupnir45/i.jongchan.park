//
//  TabBarController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //탭바 설정합니다.
    
    UINavigationController *firstItem = self.viewControllers[0];
    UINavigationController *secondItem = self.viewControllers[1];
    
    
    UIImage *firstImage = [UIImage imageNamed:@"gen1-1"];
    UIImage *highlightedFirstImage = [UIImage imageNamed:@"gen1-2"];
    UIImage *secondImage = [UIImage imageNamed:@"gen2-1"];
    UIImage *highlightedSecondImage = [UIImage imageNamed:@"gen2-2"];
    
    firstItem.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"1세대" image:firstImage selectedImage:highlightedFirstImage];
    secondItem.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"2세대" image:secondImage selectedImage:highlightedSecondImage];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
