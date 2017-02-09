//
//  ViewController.m
//  BubbleSortPrac
//
//  Created by 박종찬 on 2017. 2. 9..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //적은 배열 테스트
    NSArray *dataArray = @[@5,@3,@7,@1,@6,@9,@2];
    NSArray *resultArray = [self mergeSort:dataArray];
    
//    //큰 배열 테스트
//    NSMutableArray *dataRandom = [[NSMutableArray alloc]init];
//    
//    for (NSInteger i = 0; i<10000; i++) {
//        NSInteger temp = arc4random() % 10000;
//        [dataRandom addObject:[NSNumber numberWithInteger:temp]];
//    }
    
//    NSArray *resultArray = [self quickSort:dataRandom];

    
    NSLog(@"%@",resultArray);
    
    
    
    
}


- (NSArray *)bubbleSortPrac:(NSArray *)arrayToSort {
    
    NSMutableArray *sortingArray = [NSMutableArray arrayWithArray:arrayToSort];
    
    for (NSInteger j = sortingArray.count-1; j > 0; j--) {
        for (NSInteger i = 0; i < j; i++) {
            if (sortingArray[i] > sortingArray[i+1]) {
                [sortingArray exchangeObjectAtIndex:i withObjectAtIndex:i+1];
            }
        }
    }
    
    return sortingArray;

}


-(NSArray *)quickSort:(NSArray *)dataArray {
    //아이템이 1개이거나 없으면 바로 리턴시킨다.
    if (dataArray.count < 2) {
        return dataArray;
    }
    
    //이외의 경우에는 비교를 수행해야 하므로, 우선 뮤터블 카피를 만들어 저장한다.
    NSMutableArray *sortingArray = [dataArray mutableCopy];
    
    if (sortingArray.count == 2) { //아이템이 2개면 두개만 비교한다.
        
        if (sortingArray[0] > sortingArray[1]) {
            [sortingArray exchangeObjectAtIndex:0 withObjectAtIndex:1];
        }
        
    } else if (sortingArray.count > 2) { //아이템이 2개 이상일 때 퀵정렬을 시작한다.
        
        //첫번째 아이템을 피벗포인트로 정한다.
        NSNumber *pivot = [sortingArray objectAtIndex:0];
        
        //피벗보다 큰 것과 작은 것을 담을 배열을 만든다.
        NSMutableArray *smallArray = [[NSMutableArray alloc] init];
        NSMutableArray *bigArray = [[NSMutableArray alloc] init];
        
        //각 아이템에 대하여 피벗과 비교한 후 준비한 어레이에 넣어준다.
        for (NSInteger i = 1; i < sortingArray.count; i++) {
            if (pivot > sortingArray[i]) {
                [smallArray addObject:sortingArray[i]];
            } else {
                [bigArray addObject:sortingArray[i]];
            }
        }
        
        //각 어레이를 재귀적으로 정렬, 어레이를 반환 받는다.
            NSArray *sortedBigArray = [self quickSort:bigArray];
            NSArray *sortedSmallArray = [self quickSort:smallArray];
        
        
        //최종적으로 반환하기 위한 어레이를 준비, 작은 어레이, 피벗, 큰 어레이 순으로 붙여서 뮤터블 어레이에 넣는다.
        sortingArray = [NSMutableArray arrayWithArray:sortedSmallArray];
        [sortingArray addObject:pivot];
        [sortingArray addObjectsFromArray:sortedBigArray];
        
    }
    
    //반환한다.
    return sortingArray;
    
}

-(NSArray *)mergeSort:(NSArray *)dataArray {
    NSMutableArray *sortingArray = [NSMutableArray arrayWithArray:dataArray];
    
    //아이템이 1개이거나 없으면 바로 리턴시킨다.
    if (dataArray.count < 2) {
        return dataArray;
    }
    
        
    if (sortingArray.count == 2) { //아이템이 2개면 두개만 비교한다.
        
        if (sortingArray[0] > sortingArray[1]) {
            [sortingArray exchangeObjectAtIndex:0 withObjectAtIndex:1];
        }

    } else if (sortingArray.count > 2) { //아이템이 2개 이상일 때 머지정렬을 시작한다.
        
        //배열을 가를 길이를 결정해서, 배열을 나눈다.
        NSInteger lengthOfArray1 = sortingArray.count / 2;
        NSInteger lengthOfArray2 = sortingArray.count - lengthOfArray1;
        NSArray *array1 = [sortingArray subarrayWithRange:NSMakeRange(0, lengthOfArray1)];
        NSArray *array2 = [sortingArray subarrayWithRange:NSMakeRange(lengthOfArray1, lengthOfArray2)];
        
        
        //각각 재귀적으로 결과값을 받는다.
        NSMutableArray *array1Result = [[self mergeSort:array1] mutableCopy];
        NSMutableArray *array2Result = [[self mergeSort:array2] mutableCopy];
        
        //리턴할 배열을 초기화한다.
        [sortingArray removeAllObjects];
        
        
        //둘 중에 하나의 배열 개수가 0이 되기 전까지 작은 것끼리 비교하여 작은 것을 결과 어레이에 넣고, 해당 아이템을 삭제한다.
        while (array1Result.count * array2Result.count > 0) {
            if ([array1Result firstObject]<[array2Result firstObject]) {
                [sortingArray addObject: [array1Result firstObject]];
                [array1Result removeObjectAtIndex:0];
            } else {
                [sortingArray addObject: [array2Result firstObject]];
                [array2Result removeObjectAtIndex:0];
            }
        }
        
        //남은 어레이의 큰 수들을 뒤에 붙인다.
        
        if (array1Result.count) {
            [sortingArray addObjectsFromArray:array1Result];
        } else {
            [sortingArray addObjectsFromArray:array2Result];
        }
        
    }
    
    return sortingArray;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
