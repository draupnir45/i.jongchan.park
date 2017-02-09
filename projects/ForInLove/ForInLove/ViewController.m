//
//  ViewController.m
//  ForInLove
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
    
    NSArray *arrTest1 = @[@"7",@"1",@"1",@"3",@"6",@"3",@"6",@"7",@"8"];
    
    NSMutableArray *resultMutableArray = [[NSMutableArray alloc] init];
    
    for (NSString *i in arrTest1) {
        if (![resultMutableArray containsObject:i]) {
            [resultMutableArray addObject:i];
        }
    }
    
    NSArray *resultArray = [resultMutableArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSLog(@"%@",resultArray);
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
