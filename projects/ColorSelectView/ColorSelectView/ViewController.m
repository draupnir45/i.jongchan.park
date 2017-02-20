//
//  ViewController.m
//  ColorSelectView
//
//  Created by 박종찬 on 2017. 2. 20..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView    *scrollView;
@property (nonatomic, weak) UIView          *baseView;
@property (nonatomic, weak) UIButton        *selectBtn;
@property NSArray                           *colors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.colors = @[[UIColor colorWithRed:117.0/255.0 green:75.0/255.0 blue:59.0/255.0 alpha:1.0], [UIColor colorWithRed:235.0/255.0 green:230.0/255 blue:218.0/255 alpha:1.0], [UIColor colorWithRed:228.0/255 green:188.0/255 blue:179.0/255 alpha:1.0]];
    
    [self.view setBackgroundColor:self.colors[0]];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.delegate = self;
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height)];
    [scrollView setPagingEnabled:YES];
    for (NSInteger i = 0; i<3; i++) {
        
        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        UIImageView *imageTemp = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, 210, 200, 200)];
        imageTemp.image = [UIImage imageNamed:[NSString stringWithFormat:@"color%ld.png", i+1]];
        
        [temp addSubview:imageTemp];
        [scrollView addSubview:temp];

    }
    
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, self.view.frame.size.height - 300)];
    [baseView setBackgroundColor:[UIColor whiteColor]];
    [baseView.layer setCornerRadius:5];
    [self.view addSubview:baseView];
    self.baseView = baseView;
    
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    UIButton *selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, self.view.frame.size.height - 250, 200, 50)];
    [selectBtn setBackgroundColor:self.colors[0]];
    [selectBtn.layer setCornerRadius:25];
    [selectBtn setTitle:@"SELECT" forState:UIControlStateNormal];
    
    [self.view addSubview:selectBtn];
    self.selectBtn = selectBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (targetContentOffset->x == 0) {
        [self.view setBackgroundColor:self.colors[0]];
        [self.selectBtn setBackgroundColor:self.colors[0]];
    } else if (targetContentOffset->x == self.view.frame.size.width) {
        [self.view setBackgroundColor:self.colors[1]];
        [self.selectBtn setBackgroundColor:self.colors[1]];
    } else if (targetContentOffset->x == self.view.frame.size.width * 2) {
        [self.view setBackgroundColor:self.colors[2]];
        [self.selectBtn setBackgroundColor:self.colors[2]];
    }
}

@end
