//
//  ViewController.m
//  CardViewPrac
//
//  Created by 박종찬 on 2017. 2. 10..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSMutableArray *dataArray;
@property (nonatomic) NSMutableArray *viewArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = self.view.frame;
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:self.scrollView];
    
    self.dataArray = [[NSMutableArray alloc] init];
    self.viewArray = [[NSMutableArray alloc] init];


    for (NSInteger i =0; i<8; i++) {
        UIView *tempCard = [[UIView alloc] initWithFrame:CGRectMake(15, 30+88*i, frame.size.width - 30, frame.size.height - 100)];
        [tempCard.layer setCornerRadius:10];
        [tempCard setBackgroundColor:[UIColor whiteColor]];
        [tempCard.layer setShadowOpacity:0.2];
        [tempCard.layer setShadowColor:[[UIColor blackColor] CGColor]];
        UIButton *tapToOpenButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, tempCard.frame.size.width, tempCard.frame.size.height)];
        tapToOpenButton.tag = i;
        [tapToOpenButton addTarget:self action:@selector(openCard:) forControlEvents:UIControlEventTouchUpInside];
        [tempCard addSubview:tapToOpenButton];
        [self.scrollView addSubview:tempCard];
        [self.viewArray addObject:tempCard];
        
    }
    
    [self.scrollView setContentSize:CGSizeMake(frame.size.width, frame.size.height * 2)];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)openCard:(UIButton *)sender {
//    NSLog(@"touch is ok");
    NSInteger index = sender.tag;
    UIView *item = [self.viewArray objectAtIndex:index];
    [self.viewArray removeObject:item];
    
    for (NSInteger i = 0; i<self.viewArray.count; i++) {
        UIView *otherItem = self.viewArray[i];
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{[otherItem setFrame:CGRectMake(15, (item.frame.origin.y-30) + self.view.frame.size.height - 40 + 5*i, otherItem.frame.size.width, otherItem.frame.size.height)];}
                         completion:nil];
        
    }
    
    self.scrollView.scrollEnabled = NO;
    [self.scrollView setContentOffset:CGPointMake(0, item.frame.origin.y-30) animated:YES];
    
    [self.viewArray insertObject:item atIndex:index];
    
    for (NSInteger i =0; i<self.viewArray.count; i++) {
        UIView *itemToCloseBtn = [self.viewArray objectAtIndex:i];
        itemToCloseBtn.subviews[0].alpha = 0;
    }

    
    
}

@end



















