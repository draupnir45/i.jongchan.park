//
//  ViewController.m
//  TableViewCellLayOutPrac
//
//  Created by 박종찬 on 2017. 2. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *containerCell = [[UIView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 80)];
    [containerCell.layer setBorderColor:[[UIColor grayColor]CGColor]];
    [containerCell.layer setBorderWidth:1];
//    [containerCell setBackgroundColor:[UIColor grayColor]];
    
    
    UIImageView *imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    [imageHolder setImage:[UIImage imageNamed:@"imageTest.jpg"]];
    [imageHolder setContentMode:UIViewContentModeScaleAspectFill];
    [imageHolder setClipsToBounds:YES];
    
    
    UILabel *titleTextHolder = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, self.view.frame.size.width-90, 30)];
    [titleTextHolder setText:@"즐거운 수업시갼"];
    [titleTextHolder setFont:[UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold]];
//    titleTextHolder 
    [titleTextHolder setBackgroundColor:[UIColor whiteColor]];
    
    
    UILabel *subtitleTextHolder = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, self.view.frame.size.width-90, 20)];
    [subtitleTextHolder setBackgroundColor:[UIColor whiteColor]];
    [subtitleTextHolder setText:@"그럴 수 있어 졸릴 수 있어"];
    [subtitleTextHolder setFont:[UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular]];
    
    
    [containerCell addSubview:imageHolder];
    [containerCell addSubview:titleTextHolder];
    [containerCell addSubview:subtitleTextHolder];
    [self.view addSubview:containerCell];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    [btn setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [btn addTarget:self action:@selector(btnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Hi" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnTouched:(UIButton *)sender {
    [sender setTitle:@"World!" forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
