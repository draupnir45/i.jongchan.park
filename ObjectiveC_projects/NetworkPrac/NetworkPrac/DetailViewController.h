//
//  DetailViewController.h
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PostModel;

@interface DetailViewController : UIViewController

@property PostModel *post;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
