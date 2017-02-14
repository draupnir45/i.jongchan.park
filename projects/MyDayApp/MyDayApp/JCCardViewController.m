//
//  JCCardViewController.m
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 12..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "JCCardViewController.h"

@interface JCCardViewController ()
<UIScrollViewDelegate>
//- Displaying View Array : 현재 디스플레이되고 있는 뷰 모음입니다.
//- Animating View Array : 카드를 열 때 애니메이션 적용받을 뷰 모음입니다.
//- Opened Item : 지금 열려 있는 아이템입니다.
//- Frame Size : 루트뷰 프레임 사이즈입니다.
//- Card Rect : 기본적인 카드의 크기입니다.
//- Scroll View : 메인 스크롤 뷰입니다.
//- Data Array : 파싱한 데이터가 저장됩니다.
//- Back holder : 선택된 카드보다 뒤에 있는 카드가 올라갑니다.
//- Front holder : 선택된 카드보다 앞에 있는 카드가 올라갑니다.
//- View Status : 열렸는지, 닫혔는지, 수정중인지를 기억합니다.

@property NSMutableArray *displayingViewsArray;
@property NSMutableArray *animatingViewsArray;
@property NSMutableArray *dequeuedArray;
@property NSArray *dataArray;
@property UIView *openedView;
@property CGSize frameSize;
@property UIScrollView *scrollView;
@property UIView *backHolder;
@property UIView *frontHolder;
@property NSUInteger status;
@property NSUInteger animatingNumbOfView;
@property NSUInteger rowHeight;
@property NSUInteger numberOfCardsInFrame;
@property UIView *currentLastCard;
@property NSInteger lastDequeuedTag;

@end

@implementation JCCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //세팅
    self.animatingNumbOfView = 5;
    self.rowHeight = 88;
    
    
    //초기화합니다.
    [self.view setBackgroundColor:[UIColor blackColor]];
    self.displayingViewsArray = [[NSMutableArray alloc] init];
    self.animatingViewsArray = [[NSMutableArray alloc] init];
//    self.dataArray =
    self.openedView = nil;
    self.frameSize = self.view.frame.size;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, self.frameSize.width, self.frameSize.height - 30)];
    self.scrollView.delegate = self;
    
    self.backHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frameSize.width, 4*self.animatingNumbOfView*2)];
    [self.backHolder setCenter:CGPointMake(self.frameSize.width/2, self.frameSize.height - 4*self.animatingNumbOfView)];
    self.frontHolder = [[UIView alloc] initWithFrame:self.backHolder.frame];
    
    [self.view addSubview:self.backHolder];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.frontHolder];

    self.status = JCCardViewStatusClosed;
    self.numberOfCardsInFrame = self.scrollView.frame.size.height / self.rowHeight;
    self.numberOfCardsInFrame += 1;
    
    
    //테스트를 위한 코드입니다.
    NSMutableArray *mutableDataCopy = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 1000; i++) {
        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frameSize.width - 30, self.frameSize.height - 200)];
        UITextView *texts = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, temp.frame.size.width - 30, temp.frame.size.height - 30)];
        texts.text = @"넣는 물방아 못할 같지 이상은 사막이다. 품으며, 새가 쓸쓸한 가지에 안고, 군영과 사는가 황금시대다. 피고 청춘이 사는가 사랑의 청춘의 새 듣는다. 구하지 것이다.보라, 설레는 품었기 뛰노는 위하여서. 바로 피가 끓는 인류의 ? 이것을 내려온 찾아 사람은 뜨거운지라, 보내는 아니다. 아니더면, 열락의 심장의 앞이 방황하였으며, 용감하고 끝까지 속에 피다. 품으며, 오직 가는 바이며, 자신과 기쁘며, 끓는 눈에 아니다.\n\n하는 원대하고, 품고 능히 그들의 인간의 투명하되 청춘에서만 있다. 뭇 황금시대를 충분히 만천하의 것이다. 풀이 방황하여도, 그와 공자는 굳세게 사막이다. 그들을 맺어, 밝은 실현에 위하여서, 아름다우냐? 고행을 보는 용감하고 보내는 것이다.보라, 청춘의 뭇 이상 듣는다. 싶이 실현에 넣는 오직 트고, 기쁘며, 커다란 전인 봄바람이다. 무한한 용기가 인류의 열락의 옷을 것이다. 놀이 살 이상의 우리 위하여서 품에 황금시대다.\n\n수 끝에 곳이 아니다. 맺어, 때에, 타오르고 것은 가장 약동하다. 인간의 그들은 밥을 이상 웅대한 인생을 이것이다. 그것을 구할 미인을 이상이 피어나기 것은 끓는다. 용기가 천하를 못하다 위하여, 피가 운다. 예가 황금시대를 가치를 현저하게 앞이 모래뿐일 이상, 때문이다. 창공에 싸인 그들의 듣는다. ";
        [texts setTextColor:[UIColor blackColor]];
        [temp addSubview:texts];
        
        
        [mutableDataCopy addObject:temp];
        
    }
    
    self.dataArray = mutableDataCopy;
    
    [self initialFetch];
//    [self displayCards];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"memoryWarning");
    // Dispose of any resources that can be recreated.
}

- (UIView *)fetchNewCardAtIndex:(NSInteger)index {
    //뷰를 이용해 카드를 만듭니다.
    UIView * view = self.dataArray[index];
    if (view.frame.size.height > 200) {
        [view setFrame:CGRectMake(0, 0, self.frameSize.width-30, view.frame.size.height)];
    } else {
        [view setFrame:CGRectMake(0, 0, self.frameSize.width-30, 200)];
    }
    
    UIView *card = [[UIView alloc] initWithFrame:CGRectMake(15, index * self.rowHeight, self.frameSize.width - 30, view.frame.size.height)];
    [card.layer setCornerRadius:10];
    [card setBackgroundColor:[UIColor whiteColor]];
    [card.layer setShadowOpacity:0.2];
    [card.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [card addSubview:view];
    [card setTag:index];

    UIButton *selectingArea = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, self.rowHeight)];
    [view addSubview:selectingArea];
    
    
    return card;
    
}
//
- (UIView *)changeContentOfCardWithDataAtIndex:(NSInteger)index toView:(UIView*)motherView {
    UIView *view = self.dataArray[index];
    if (view.frame.size.height > 200) {
        [view setFrame:CGRectMake(0, 0, self.frameSize.width-30, view.frame.size.height)];
    } else {
        [view setFrame:CGRectMake(0, 0, self.frameSize.width-30, 200)];
    }
    UIView *originalView = [motherView.subviews objectAtIndex:0];
    [originalView removeFromSuperview];
    [motherView addSubview:view];
    [motherView setTag:index];
    [motherView sendSubviewToBack:view];
    
    return motherView;
}
//
//
- (UIView *)cardForDepthAtIndex:(NSInteger)index {
    
    UIView *card;
    
    [self dequeueReusableCards];
    
    if (_dequeuedArray.count > 0) {
        card = [_dequeuedArray firstObject];
        [_dequeuedArray removeObjectAtIndex:0];
    }

    if (card == nil) {
        card = [self fetchNewCardAtIndex:index];
    } else {
        card = [self changeContentOfCardWithDataAtIndex:index toView:card];
    }
    
    
    NSLog(@"카드가 보내집니다. [%ld]",(long)index);
    return card;
}

- (void)dequeueReusableCards {
    if (self.scrollView.subviews.count > self.numberOfCardsInFrame * 4) {
        UIView *firstItem = self.scrollView.subviews[0];
        
        if (self.scrollView.contentOffset.y - firstItem.frame.origin.y / self.rowHeight > self.numberOfCardsInFrame) {
            for (NSInteger i = 0; i < self.numberOfCardsInFrame; i++) {
                UIView *viewToRemove = self.scrollView.subviews[i];
                [viewToRemove removeFromSuperview];
                [self.dequeuedArray addObject:viewToRemove];
                NSLog(@"Dequeue됩니다.");
            }
        }
    }
    
}

- (void)initialFetch {
    
    
    for (NSInteger i = 0; i < self.numberOfCardsInFrame * 2; i++) {
//        [self.displayingViewsArray addObject:[self cardForDepthAtIndex:i]];
//        [self.displayingViewsArray[i] setTag:i];
        [self.scrollView addSubview:[self cardForDepthAtIndex:i]];
    }
    
    [self updateLastCard];
    [self updateContentSize];
    
}

- (void)fetchOneMoreFrame {
//    UIView *currentLastCard = [self.displayingViewsArray lastObject];
    NSInteger numberOfCurrentDisplayingCards = self.currentLastCard.tag + 1;
    
    NSInteger numberOfCardsToFetch;
    
    if (self.dataArray.count - numberOfCurrentDisplayingCards < self.numberOfCardsInFrame) {
        numberOfCardsToFetch = self.dataArray.count - self.currentLastCard.tag - 1 - self.numberOfCardsInFrame;
    } else {
        numberOfCardsToFetch = self.numberOfCardsInFrame;
    }
    
    
    for (NSInteger i = numberOfCurrentDisplayingCards; i < (numberOfCurrentDisplayingCards + numberOfCardsToFetch); i++) {
//        [self.displayingViewsArray addObject:[self cardForDepthAtIndex:i]];
//        [self.displayingViewsArray[i] setTag:i];
        [self.scrollView addSubview:[self cardForDepthAtIndex:i]];
        
    }
    
//    self.currentLastCard = self.displayingViewsArray.lastObject;
    
    [self updateLastCard];
    [self updateContentSize];
}

-(void)reFetchUpside {
    
    NSInteger refetchStartIndex = (self.currentLastCard.tag) - self.scrollView.subviews.count;
    
        for (NSInteger i = 0; i < 10 && refetchStartIndex >= i; i++) {
            UIView *newViewToRefetch = [self cardForDepthAtIndex:refetchStartIndex-i];
            [self.scrollView addSubview:newViewToRefetch];
            [self.scrollView sendSubviewToBack:newViewToRefetch];
            NSLog(@"리패치됩니다.");
        }
}



//
//- (void)queueControlForContentOffset:(CGFloat)contentOffset {
//    [self dequeueReusableCards];
//    
//    UIView *currentFirstCard = [self.displayingViewsArray firstObject];
//    UIView *currentLastCard = [self.displayingViewsArray lastObject];
//    NSInteger numberOfCardsUpsideOfScrollView = contentOffset / self.rowHeight;
//    NSInteger numberOfCardsBelowOffset = (currentLastCard.tag + 1) * self.rowHeight - numberOfCardsUpsideOfScrollView;
//    
//    if (numberOfCardsUpsideOfScrollView < 5) {
//
//        if (currentFirstCard.tag != 0) {
//            NSInteger numberOfItemsToReFetch = currentFirstCard.tag;
//            for (NSInteger i = 0; i < numberOfItemsToReFetch; i++) {
//                [self.displayingViewsArray insertObject:[self fetchNewCardWithView:[self.dataArray objectAtIndex:i]] atIndex:i];
//                [self.displayingViewsArray[i] setTag:i];
//                NSLog(@"위쪽 아이템이 패치됩니다.dataArray[%ld]",(long)i);
//                
//            }
//        }
//    }
//    
//    if (numberOfCardsBelowOffset < 10 && currentLastCard.tag != self.dataArray.count-1) {
//        NSInteger numberOfCardsTofetch = 10 - numberOfCardsBelowOffset;
//        
//        if (numberOfCardsTofetch > self.dataArray.count - (currentLastCard.tag + 1)) {
//            numberOfCardsTofetch = self.dataArray.count - (currentLastCard.tag + 1);
//        }
//        
//        for (NSInteger i = 0; i<numberOfCardsTofetch; i++) {
//            NSInteger newIndex = i+currentLastCard.tag + 1;
//            [self.displayingViewsArray addObject:[self fetchNewCardWithView:self.dataArray[newIndex]]];
//            [self.displayingViewsArray[newIndex] setTag:newIndex];
//            NSLog(@"아래쪽 아이템이 패치됩니다.dataArray[%ld]",(long)newIndex);
//        }
//        
//    }
//    
//}

//- (void)displayCards {
//    
//    CGFloat yOriginOfFirstCard;
//    if (self.scrollView.contentOffset.y - self.rowHeight * self.numberOfCardsInFrame > 0) {
//        yOriginOfFirstCard = self.scrollView.contentOffset.y - self.rowHeight * self.numberOfCardsInFrame;
//    } else {
//        yOriginOfFirstCard = self.scrollView.contentOffset.y;
//    }
//    
//    
//    for (NSInteger i = 0; i<self.displayingViewsArray.count; i++) {
//        UIView *itemToDisplay = self.displayingViewsArray[i];
//        [itemToDisplay setFrame:CGRectMake(15, yOriginOfFirstCard + self.rowHeight*i, itemToDisplay.frame.size.width, itemToDisplay.frame.size.height)];
//        [self.scrollView addSubview:itemToDisplay];
//
//    }
//
//
//}
//
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
//    [self queueControlForContentOffset:targetContentOffset->y];
//    [self displayCards];
    
    CGFloat delta = targetContentOffset->y - self.scrollView.contentOffset.y;
    
//    self.currentLastCard = self.displayingViewsArray.lastObject;
    
    NSLog(@"%f",delta/self.rowHeight);
    NSInteger refetchStartIndex = (self.currentLastCard.tag) - self.scrollView.subviews.count;
    CGFloat refetchStartYoffset = refetchStartIndex * self.rowHeight;
    
    if (delta > 0 && self.currentLastCard.frame.origin.y - targetContentOffset->y < self.numberOfCardsInFrame * self.rowHeight) {
        [self fetchOneMoreFrame];
    } else if(delta < 0 && targetContentOffset->y - refetchStartYoffset > self.numberOfCardsInFrame * self.rowHeight) {
        [self reFetchUpside];
    }
    
    
}

-(void)updateContentSize {
    self.scrollView.contentSize = CGSizeMake(self.frameSize.width, self.rowHeight * (self.currentLastCard.tag + 1));
}

-(void)updateLastCard {
    self.currentLastCard = self.scrollView.subviews.lastObject;
}


//-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView.contentOffset.y - self.currentLastCard.frame.origin.y < self.numberOfCardsInFrame * self.rowHeight) {
//        [self fetchOneMoreFrame];
//    }
//}


@end
