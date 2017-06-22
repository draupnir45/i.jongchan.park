//
//  ViewController.m
//  WhyMeWhy
//
//  Created by 박종찬 on 2017. 3. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.imageView.image =
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cfile4.uf.tistory.com/image/2259303C57A1A00E17CF9E"]]];
    
//    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://pbs.twimg.com/media/CxNc8DUUcAA7Bul.jpg"]]];
    
    
    [self setImageToImageView:self.imageView withURL:@"https://pbs.twimg.com/media/CvyGuL1UEAATL3y.jpg"];
    [self setImageToImageView:self.imageView2 withURL:@"https://i.ytimg.com/vi/cbBLtQizxPM/maxresdefault.jpg"];
    [self setImageToImageView:self.imageView3 withURL:@"https://pbs.twimg.com/media/CxNc8DUUcAA7Bul.jpg"];
    [self setImageToImageView:self.imageView4 withURL:@"https://image-proxy.namuwikiusercontent.com/r/https%3A%2F%2Fpbs.twimg.com%2Fmedia%2FCtNKrc9UMAAcXtH.jpg"];
    
    
    
}

- (void)setImageToImageView:(UIImageView *)imageView withURL:(NSString *)urlStr {
    NSURL *thumbnailURL = [NSURL URLWithString:urlStr];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionTask *task = [session dataTaskWithURL:thumbnailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    imageView.image = image;
                });
                
            }
        }
    }];
    
    [task resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
