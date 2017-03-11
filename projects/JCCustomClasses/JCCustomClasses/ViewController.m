//
//  ViewController.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 4..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"
#import "JCAlertController.h"
#import "JCRandomRollImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    typedef NSString * (^MyBlockType)(NSInteger, NSString *);
    
    MyBlockType myBlockInstance = ^(NSInteger intParam, NSString *textParam) {
        return [NSString stringWithFormat:@"%@ : %ld",textParam,(long)intParam];
    };
    
    NSLog(@"%@",myBlockInstance(4, @"hi"));

    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)alertAction:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"test" message:@"test" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)test:(id)sender {
//    JCAlertController *alert = [JCAlertController alertControllerWithTitle:@"test" message:@"sss" preferredStyle: UIAlertControllerStyleAlert cancelTitle:@"취취소" okTitle:@"옷키" touchedSwitch:sender ];
//    [self presentViewController:alert animated:YES completion:nil];
    JCAlertController *alert2 = [JCAlertController alertControllerWithTitle:@"Test" message:@"test" preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"취소" okTitle:@"확인" okHandler:^(UIAlertAction *action) {
        NSLog(@"확인이 선택됨");
    }];
    
    [self presentViewController:alert2 animated:YES completion:nil];
    
    
}

- (IBAction)rollIt:(id)sender {
    
    NSArray *imgArray = @[ [UIImage imageNamed:@"thumbnail_1"],[UIImage imageNamed:@"thumbnail_4"], [UIImage imageNamed:@"thumbnail_7"], [UIImage imageNamed:@"thumbnail_1"],[UIImage imageNamed:@"thumbnail_4"], [UIImage imageNamed:@"thumbnail_7"], [UIImage imageNamed:@"thumbnail_1"],[UIImage imageNamed:@"thumbnail_4"], [UIImage imageNamed:@"thumbnail_7"], [UIImage imageNamed:@"thumbnail_1"],[UIImage imageNamed:@"thumbnail_4"], [UIImage imageNamed:@"thumbnail_7"], [UIImage imageNamed:@"thumbnail_1"],[UIImage imageNamed:@"thumbnail_4"], [UIImage imageNamed:@"thumbnail_7"]];
    
    [self.rollingImageView rollWithImageArray:imgArray timeIntervel:0.07];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
