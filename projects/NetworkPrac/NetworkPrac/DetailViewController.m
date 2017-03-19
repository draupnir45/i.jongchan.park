//
//  DetailViewController.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DetailViewController.h"
#import "PostModel.h"
#import "DataCenter.h"
@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.post.title;
    self.contentLabel.text = self.post.content;
    NSData *imgData = [[[DataCenter sharedData] imgDict] objectForKey:[NSNumber numberWithInteger:self.post.postPK]];
    if (imgData) {
        self.imageView.image = [UIImage imageWithData:imgData];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
