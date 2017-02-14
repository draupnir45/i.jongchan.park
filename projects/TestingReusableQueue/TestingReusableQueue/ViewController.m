//
//  ViewController.m
//  TestingReusableQueue
//
//  Created by 박종찬 on 2017. 2. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIScrollViewDelegate>

@property UIScrollView *scrollView;
@property NSMutableArray *dataSource;
@property NSInteger rowHeight;
@property NSRange displayingRange;
@property NSInteger numberOfCardToPrepare;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100)];
    [self.view addSubview: self.scrollView];
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2)];
    self.scrollView.delegate = self;
    
    self.dataSource = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i<100; i++) {
        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        [temp setCenter:CGPointMake(self.view.center.x, self.view.center.y - 250 + 50*i)];
        [temp.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [temp.layer setShadowOpacity:0.2];
        [temp setBackgroundColor:[UIColor whiteColor]];
        [self.dataSource addObject:temp];
    }
    
    self.rowHeight = 50;
    self.numberOfCardToPrepare = 5;
    
    for (NSInteger i = 0; i<5; i++) {
            [self.scrollView addSubview:self.dataSource[i]];
    }
    

    

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    //아래쪽으로 패칭, 몇 개를 패칭해야 하는지 검사
    
    CGFloat delta = targetContentOffset->y-self.scrollView.contentOffset.y;
    NSLog(@"delta:%f",delta);
    
    NSInteger targetFocusedCardIndex = [self focusedCardIndex:targetContentOffset->y];
    
    NSRange rangeToFetch = NSMakeRange(targetFocusedCardIndex, self.numberOfCardToPrepare);
    [self fetchCardsWithRange:rangeToFetch];
    
    
}

-(NSInteger)focusedCardIndex:(CGFloat)contentOffsetY {
    return (contentOffsetY / self.rowHeight);
}

-(void)fetchCardsWithRange:(NSRange)range {
    for (NSInteger i = 0; i<range.length; i++) {
        UIView *focusedCard = [self.dataSource objectAtIndex:i+range.location];
        if (![self.scrollView.subviews containsObject:focusedCard]) {
            [self.scrollView addSubview:focusedCard];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
