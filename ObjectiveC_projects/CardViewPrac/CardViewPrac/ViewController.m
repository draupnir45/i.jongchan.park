//
//  ViewController.m
//  CardViewPrac
//
//  Created by 박종찬 on 2017. 2. 10..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIScrollViewDelegate>

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSMutableArray *dataArray;
@property (nonatomic) NSMutableArray *viewArray;
@property (nonatomic) UIView *backViewHolder;
@property (nonatomic) UIView *frontViewHolder;
@property (nonatomic) UIView *openedCard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = self.view.frame;
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.backViewHolder = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height - 40, frame.size.width, 40)];
    self.frontViewHolder = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height - 40, frame.size.width, 40)];
    
    [self.view addSubview:self.backViewHolder];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.frontViewHolder];
    
    _scrollView.delegate = self;
    
    self.dataArray = [[NSMutableArray alloc] init];
    self.viewArray = [[NSMutableArray alloc] init];
    



    for (NSInteger i =0; i<12; i++) {
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
    
    
    
    [self.scrollView setContentSize:CGSizeMake(frame.size.width, frame.size.height * 1.3)];
    

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
        NSInteger otherItemWidth = (otherItem.frame.size.width + 4*(i-index));
//        NSInteger otherItemWidth = (otherItem.frame.size.width-4*self.viewArray.count + 4*i);
//        [UIView animateWithDuration:0.5
//                              delay:0.0
//                            options:UIViewAnimationOptionCurveEaseInOut
//                         animations:^{[otherItem setFrame:CGRectMake((self.view.frame.size.width-otherItemWidth)/2, self.scrollView.contentOffset.y + self.view.frame.size.height - 40 + 4*i, otherItemWidth, otherItem.frame.size.height)];}
//                         completion:nil];
//        [otherItem removeFromSuperview];
        
        if (i<index) {
            
            [UIView animateWithDuration:0.5
                                  delay:0.0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{[otherItem setFrame:CGRectMake((self.view.frame.size.width-otherItemWidth)/2, self.scrollView.contentOffset.y + self.view.frame.size.height - 4*i, otherItemWidth, otherItem.frame.size.height)];}
                             completion:nil];
                    [otherItem removeFromSuperview];
            [self.backViewHolder addSubview:otherItem];
            [otherItem setFrame:CGRectMake(otherItem.frame.origin.x, 4*i, otherItem.frame.size.width, otherItem.frame.size.height)];
        } else {
            
            [UIView animateWithDuration:0.5
                                  delay:0.0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{[otherItem setFrame:CGRectMake((self.view.frame.size.width-otherItemWidth)/2 - 2, self.scrollView.contentOffset.y + self.view.frame.size.height + 4*(i+1), otherItemWidth+4, otherItem.frame.size.height)];}
                             completion:nil];
                    [otherItem removeFromSuperview];
            [self.frontViewHolder addSubview:otherItem];
            [otherItem setFrame:CGRectMake(otherItem.frame.origin.x, 4*(i+1), otherItem.frame.size.width, otherItem.frame.size.height)];

        }
    }
    
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{[item setFrame:CGRectMake(15, self.scrollView.contentOffset.y + 30, item.frame.size.width, item.frame.size.height)];}
                     completion:nil];
    
    self.openedCard = item;
//    self.scrollView.scrollEnabled = NO;
//    [self.scrollView setContentOffset:CGPointMake(0, item.frame.origin.y-30) animated:YES];
    
    [self.viewArray insertObject:item atIndex:index];
    
    for (NSInteger i =0; i<self.viewArray.count; i++) {
        UIView *itemToCloseBtn = [self.viewArray objectAtIndex:i];
        itemToCloseBtn.subviews[0].alpha = 0;
        
        
    }

    
    
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset  {
    
    if ((targetContentOffset->y - self.scrollView.contentOffset.y)>50) {
        NSLog(@"Let's closeCard");
        [self closeCard];
    } else {
        targetContentOffset->y = self.scrollView.contentOffset.y;
    }
    
}

-(void)closeCard {
    
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{[_openedCard setFrame:CGRectMake((self.view.frame.size.width-_openedCard.frame.size.width)/2, self.scrollView.contentOffset.y + self.view.frame.size.height - 4*[self.viewArray indexOfObject:_openedCard], _openedCard.frame.size.width, _openedCard.frame.size.height)];} completion:nil];
    
    for (NSInteger i =0; i<self.viewArray.count; i++) {
        UIView *itemTemp = [self.viewArray objectAtIndex:i];
        NSInteger index = [self.viewArray indexOfObject:self.openedCard];
        NSInteger itemTempWidth = (itemTemp.frame.size.width + 4*(i-index));
        itemTemp.subviews[0].alpha = 1.0;
        [itemTemp removeFromSuperview];
        [self.scrollView addSubview:itemTemp];
        [itemTemp setFrame:CGRectMake((self.view.frame.size.width-itemTempWidth)/2, self.scrollView.contentOffset.y + self.view.frame.size.height - 4*i, itemTempWidth, itemTemp.frame.size.height)];
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{[itemTemp setFrame:CGRectMake(15, 30+88*i, self.view.frame.size.width - 30, self.view.frame.size.height - 100)];} completion:nil];
        
        
    }
    
    
    
}


@end



















