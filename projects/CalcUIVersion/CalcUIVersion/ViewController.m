//
//  ViewController.m
//  CalcUIVersion
//
//  Created by 박종찬 on 2017. 2. 6..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property CGFloat currentResult;
@property UILabel *resultLabel;
@property NSMutableArray *numBtnArray;
@property NSMutableArray *opBtnArray;
@property bool isClear;
@property UIButton *clearButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isClear = YES;
    self.currentResult = 0;
    self.numBtnArray = [[NSMutableArray alloc]init];
    
    self.resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, self.view.frame.size.width-20, self.view.frame.size.height* 2 / 7 - 20)];
    [self.resultLabel setText:[NSString stringWithFormat:@"%.0f",self.currentResult]];
    [self.resultLabel setTextAlignment:NSTextAlignmentRight];
    [self.resultLabel setFont:[UIFont systemFontOfSize:100 weight:-1.0]];
    [self.resultLabel setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:self.resultLabel];
    
    CGSize sevenBlockSizes = CGSizeMake(self.view.frame.size.width/4, self.view.frame.size.height/7);
    NSInteger i = 0;
    UIControl *test;
    
    for (i = 0; i<10; i++) {
        CGPoint numBtnPoint = CGPointZero;
        
        switch (i) {
            case 0:
                numBtnPoint.y = sevenBlockSizes.height*6;
                break;
            case 1:
            case 2:
            case 3:
                numBtnPoint.y = sevenBlockSizes.height*5;
                break;
            case 4:
            case 5:
            case 6:
                numBtnPoint.y = sevenBlockSizes.height*4;
                break;
            case 7:
            case 8:
            case 9:
                numBtnPoint.y = sevenBlockSizes.height*3;
                break;
            default:
                break;
        }
        
        if (i==0) {
            numBtnPoint.x = 0;
        } else {
            switch (i%3) {
                case 1:
                    numBtnPoint.x = 0;
                    break;
                case 2:
                    numBtnPoint.x = sevenBlockSizes.width;
                    break;
                case 0:
                    numBtnPoint.x = sevenBlockSizes.width*2;
                default:
                    break;
            }
        }
        
        
        
        
        UIButton *temp = [[UIButton alloc] initWithFrame:CGRectMake(numBtnPoint.x, numBtnPoint.y, sevenBlockSizes.width, sevenBlockSizes.height)];
        [temp setTitle:[NSString stringWithFormat:@"%ld",(long)i] forState:UIControlStateNormal];
        [temp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [temp setBackgroundColor:[UIColor grayColor]];
        [temp.layer setBorderColor:[[UIColor blackColor]CGColor]];
        [temp.layer setBorderWidth:0.5];
        [temp addTarget:self action:@selector(numBtnSelected:) forControlEvents:UIControlEventTouchUpInside];
        [temp.titleLabel setFont:[UIFont systemFontOfSize:50 weight:-1.0]];
        [self.numBtnArray addObject:temp];
        [self.view addSubview:_numBtnArray[i]];
    }
    
    self.clearButton = [[UIButton alloc]initWithFrame:CGRectMake(0, sevenBlockSizes.height*2, sevenBlockSizes.width, sevenBlockSizes.height)];
    [self.clearButton setTitle:@"AC" forState:UIControlStateNormal];
    [self.clearButton.titleLabel setFont:[UIFont systemFontOfSize:40 weight:-0.7]];
    [self.clearButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.clearButton setBackgroundColor:[UIColor orangeColor]];
    [self.clearButton.layer setBorderColor:[[UIColor blackColor]CGColor]];
    [self.clearButton.layer setBorderWidth:0.5];
    [self.view addSubview:self.clearButton];
    [self.clearButton addTarget:self action:@selector(numbClear:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)numBtnSelected:(UIButton *)sender {
    if (self.currentResult == 0) {
        self.resultLabel.text = sender.currentTitle;
    } else {
        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:sender.currentTitle];
    }
    self.currentResult = [self.resultLabel.text integerValue];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
