//
//  ViewController.m
//  PageControlTest
//
//  Created by 박종찬 on 2017. 2. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

<UIScrollViewDelegate>

@property UIPageControl *pageControl;
@property UIScrollView *scrollView;
@property UILabel *pmDescription;
@property NSArray *pmDesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize frameSize = self.view.frame.size;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frameSize.width, frameSize.height)];
        [self.scrollView setPagingEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(frameSize.width * 2, frameSize.height)];
    self.scrollView.delegate = self;
    self.scrollView.scrollEnabled = NO;
    
    [self.view addSubview:self.scrollView];
    
    UIView *subView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frameSize.width, frameSize.height)];
    [subView1 setBackgroundColor:[UIColor blackColor]];

    
    UISwitch *testSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [testSwitch setCenter:self.view.center];
    [testSwitch addTarget:self action:@selector(scrollEnabled:) forControlEvents:UIControlEventValueChanged];
    [subView1 addSubview:testSwitch];
    
    [self.scrollView addSubview:subView1];
    
    
    UIView *subView2 = [[UIView alloc] initWithFrame:CGRectMake(frameSize.width, 0, frameSize.width, frameSize.height)];
    [subView2 setBackgroundColor:[UIColor grayColor]];
    [self.scrollView addSubview:subView2];
    
    
   self.pmDesArray = @[@"뜨거운 것을 좋아하는 성격이다. 꼬리에 있는 불꽃은 생명을 나타내는 표시로 건강하면 강한 불꽃이 나오고 건강하지 않으면 약한 불꽃이 나온다. 꼬리의 불꽃은 기분을 나타내기도 하는데, 즐거우면 불꽃이 살랑살랑 흔들리고 화나면 맹렬하게 불타오른다. 꼬리에 물이 적게 닿으면 아무 일 없이 불꽃이 타오르나 비에 꼬리가 젖으면 불꽃 대신 연기만 난다. 타오르는 소리는 조용한 곳에 데려가면 들을 수 있다. 리자드로 진화한다.", @"태어날 때부터 등에 있는 이상한 씨앗과 함께 성장하며 자란다. 이상해씨는 며칠 동안 굶어도 이상이 없는데, 그 이유는 씨앗에 영양분이 가득해 진화하기 전까지 등에 자라는 씨앗에서 영양분을 얻을 수 있기 때문이다. 몸이 자라는 만큼 씨앗도 같이 자라며, 이 씨앗은 광합성을 통해 자라기도 한다. 일정 수준이 지나 씨앗이 꽃봉오리가 되면 이상해풀로 진화한다.", @"꼬마 거북이 포켓몬. 딱딱한 등껍질은 여러모로 쓸모가 많다. 일단 몸을 지키는 것도 있지만 반격을 할 때 더 효과가 좋다고 한다. 그리고 위험해지면 등껍질 안에서 물을 내뿜을 수도 있다. 그리고 등껍질의 홈을 이용해 물의 저항을 줄여 빠르게 헤엄칠 수도 있다고 한다. 태어난 직후에는 연하고 약했던 등껍질도 자라서 단단하고 탄력있는 등껍질로 변한다. 어니부기로 진화한다."];
    UISegmentedControl *segments = [[UISegmentedControl alloc] init];
    [segments insertSegmentWithTitle:@"파이리" atIndex:0 animated:YES];
    [segments insertSegmentWithTitle:@"이상해씨" atIndex:1 animated:YES];
    [segments insertSegmentWithTitle:@"꼬부기" atIndex:2 animated:YES];
    segments.tintColor = [UIColor whiteColor];
    segments.frame = CGRectMake(15, 25, frameSize.width-30, 30);
    [segments addTarget:self action:@selector(displayDiscription:) forControlEvents:UIControlEventValueChanged];
    segments.selectedSegmentIndex = 0;
    
    self.pmDescription = [[UILabel alloc] initWithFrame:CGRectMake(15, 80, frameSize.width - 30, frameSize.height - 80)];
    [self.pmDescription setTextColor:[UIColor whiteColor]];
    [self.pmDescription setText:_pmDesArray[segments.selectedSegmentIndex]];
    [self.pmDescription setNumberOfLines:20];
    
    [subView2 addSubview:self.pmDescription];
    [subView2 addSubview:segments];
    
    
    
    
    
    self.pageControl = [[UIPageControl alloc] init];
    [self.pageControl setFrame:CGRectMake(0, 0, frameSize.width, 30)];
    [self.pageControl setCenter:CGPointMake(self.view.center.x, self.view.frame.size.height -30)];
    [self.view addSubview:self.pageControl];
    [self.pageControl addTarget:self action:@selector(pagingWithIndicator:) forControlEvents:UIControlEventValueChanged];
    [self.pageControl addTarget:self action:@selector(pagingWithIndicator:) forControlEvents:UIControlEventTouchUpInside];
    self.pageControl.numberOfPages = 2;
    [self.pageControl setUserInteractionEnabled:NO];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//    NSInteger pageCount = [scrollView.subviews count];
//    
//    for (NSInteger i=0; i<pageCount; i++) {
//        if (scrollView.contentOffset.x == scrollView.subviews[i].frame.origin.x) {
//            self.pageControl.currentPage = i;
//        }
//    }
//
//}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSInteger pageCount = [scrollView.subviews count];
    
    for (NSInteger i=0; i<pageCount; i++) {
        
        if (targetContentOffset->x == scrollView.subviews[i].frame.origin.x) {
            self.pageControl.currentPage = i;
        }
        
    }
    
}

-(void)pagingWithIndicator:(UIPageControl *)sender {
    
    [self.scrollView setContentOffset:self.scrollView.subviews[sender.currentPage].frame.origin animated:YES];
    
}
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    NSInteger pageCount = [scrollView.subviews count];
//    
//    for (NSInteger i=0; i<pageCount; i++) {
//        if (scrollView.contentOffset.x == scrollView.subviews[i].frame.origin.x) {
//            self.pageControl.currentPage = i;
//        }
//    }
//}
//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//    NSInteger pageCount = [scrollView.subviews count];
//    
//    for (NSInteger i=0; i<pageCount; i++) {
//        if (scrollView.contentOffset.x == scrollView.subviews[i].frame.origin.x) {
//            self.pageControl.currentPage = i;
//        }
//    }
//}
-(void)scrollEnabled:(UISwitch *)sender {
    self.scrollView.scrollEnabled = sender.on;
    [self.pageControl setUserInteractionEnabled:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)displayDiscription:(UISegmentedControl *)sender {
    [self.pmDescription setText:_pmDesArray[sender.selectedSegmentIndex]];
}


@end
