//
//  DetailViewController.m
//  TableViewPrac
//
//  Created by 박종찬 on 2017. 2. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property UIImageView *bigImage;
@property UIButton *closeButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize frameSize = self.view.frame.size;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(frameSize.width * 1 / 6, 30, frameSize.width * 2 / 3, frameSize.width * 2 / 3)];
    [self.bigImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/%ld.png",self.pokemonIndex]]];
    [self.view addSubview:self.bigImage];
    
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(frameSize.width - 120, frameSize.height - 55, 100, 40)];
    [self.closeButton setBackgroundColor:[UIColor blackColor]];
    [self.closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.closeButton.layer setCornerRadius:20];
    [self.closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.closeButton setTitle:@"닫기" forState:UIControlStateNormal];
    
    [self.view addSubview:self.closeButton];
    
    // Do any additional setup after loading the view.
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

-(void)closeButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
