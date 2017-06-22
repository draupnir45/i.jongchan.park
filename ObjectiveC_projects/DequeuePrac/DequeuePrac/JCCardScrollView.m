//
//  JCCardScrollView.m
//  DequeuePrac
//
//  Created by 박종찬 on 2017. 2. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "JCCardScrollView.h"
#import "JCCardView.h"

@interface JCCardScrollView ()

@property (readwrite) NSMutableArray *displayingViewsArray; //; 현재 디스플레이되고 있는 뷰 모음입니다.
@property (readwrite) NSRange displayingViewRange; //현재 컨텐트 옵셋에서 디스플레이되고 있는 뷰 범위입니다.
@property (readwrite) NSMutableArray *reusableQueue; //재사용 가능한 카드뷰를 저장합니다.
@property (readwrite) NSMutableArray *animatingViewsArray; //카드를 열 때 애니메이션 적용받을 뷰 모음입니다.
@property (readwrite) JCCardView *openedItem; //지금 열려 있는 아이템입니다.
@property (readwrite) NSInteger openedItemIndex; //지금 열려 있는 아이템의 인덱스를 저장합니다.
@property (readwrite) CGSize frameSize; //루트뷰 프레임 사이즈입니다.
@property (readwrite) CGSize cardRect; //기본적인 카드의 크기입니다.
@property (readwrite) UIScrollView *scrollView; //메인 스크롤 뷰입니다.
@property (readwrite) NSMutableArray *dataArray;//파싱한 데이터가 저장됩니다.
@property (readwrite) UIView *backHolderView; //선택된 카드보다 뒤에 있는 카드가 올라갑니다.
@property (readwrite) UIView *frontHolderView; //선택된 카드보다 앞에 있는 카드가 올라갑니다.
@property (readwrite) NSInteger viewStatus; //JCCardScrollViewControllerStatus 를 업데이트합니다.
@property (readwrite) NSInteger rowHeight; //사용자가 설정하는 한 로우의 높이입니다.
@property (readwrite) NSInteger numberOfCardsInFrame;

@end


@implementation JCCardScrollView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.displayingViewsArray;
        self.displayingViewRange;
        self.reusableQueue;
        self.animatingViewsArray;
        self.openedItem;
        self.openedItemIndex;
        self.frameSize;
        self.cardRect;
        self.scrollView;
        self.dataArray;
        self.backHolderView;
        self.frontHolderView;
        self.viewStatus;
        self.rowHeight;
        self.numberOfCardsInFrame;
    }
    return self;
}


@end
