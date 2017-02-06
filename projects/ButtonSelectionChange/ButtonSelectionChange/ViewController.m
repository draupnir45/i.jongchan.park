//
//  ViewController.m
//  ButtonSelectionChange
//
//  Created by 박종찬 on 2017. 2. 6..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIButton *currentSelectedBtn;
@property NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentSelectedBtn = nil;
    NSInteger i = 0;
    self.array = [[NSMutableArray alloc] init];
    
    
    for (i=1; i<=4; i++) {
        UIButton *temp = [[UIButton alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2 - 75, 50*i, 150, 30)];
        [temp setTitle:[NSString stringWithFormat:@"%ld번 버튼",(long)i] forState:UIControlStateNormal];
        [temp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [temp.layer setCornerRadius:15];
        [temp setBackgroundColor:[UIColor blackColor]];
        [temp setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [temp setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [temp addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.array addObject:temp];
        [self.view addSubview:_array[i-1]];
    }
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)btnSelected:(UIButton *)sender {
    
    [sender setSelected:YES];
    if (_currentSelectedBtn) {
        [self.currentSelectedBtn setSelected:NO];
    }
    self.currentSelectedBtn = sender;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
