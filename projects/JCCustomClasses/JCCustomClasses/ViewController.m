//
//  ViewController.m
//  JCCustomClasses
//
//  Created by 박종찬 on 2017. 3. 4..
//  Copyright © 2017년 박종찬. All rights reserved.
//

#import "ViewController.h"
#import "JCAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)alertAction:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"test" message:@"test" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)test:(id)sender {
    JCAlertController *alert = [JCAlertController alertControllerWithTitle:@"test" message:@"sss" preferredStyle: UIAlertControllerStyleAlert cancelTitle:@"취취소" okTitle:@"옷키" touchedSwitch:sender ];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
