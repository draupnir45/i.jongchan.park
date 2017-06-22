//
//  ViewController.m
//  Collatz
//
//  Created by 박종찬 on 2017. 2. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>

@property UILabel *resultLabel;
@property UITextField *inputField;
@property NSInteger globalResult;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize frameSize = self.view.frame.size;
    
    self.inputField = [[UITextField alloc] initWithFrame:CGRectMake(frameSize.width / 2 - 100, 100, 200, 40)];
    self.inputField.delegate = self;
    [self.inputField.layer setBorderColor:[[UIColor lightGrayColor]CGColor]];
    [self.inputField.layer setBorderWidth:1.0];
    [self.inputField.layer setCornerRadius:20];
    [self.inputField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.inputField];
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(frameSize.width / 2 - 100, 200, 200, 40)];
    [self.resultLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.resultLabel];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger result= [self doCollatzConjecture:[textField.text integerValue]];
    [self.resultLabel setText:[NSString stringWithFormat:@"결과는 %ld",result]];
    return YES;
}

-(NSInteger)doCollatzRecursive1:(NSInteger)number { //재귀 버전
    NSInteger result = 0;
//    if (result == -1) { result = -1; }
    if (number == 1) { return 0; }
    result += 1;
    
    
    if (number%2) { //홀수

        result += [self doCollatzRecursive1:number * 3 + 1];
        
    } else { //짝수
        result += [self doCollatzRecursive1:number / 2];
    }
    
    return result;
    
}

///while 사용 버전
-(NSInteger)doCollatzConjecture:(NSInteger)number {
    NSInteger result = 0; //결과값 담을 변수를 만듭니다.
    
    while (number != 1) { //수가 1이 아니고 result가 500보다 작거나 같을 동안 반복합니다.
        if (number % 2 == 0) { number = number / 2; } //홀수일 경우
        else { number = number * 3 + 1; } //짝수일 경우
        result ++; //increments
    }
    
    return result; //반환
}

//-(NSInteger)doCollatzRecursive2:(NSInteger)number {
//    if (number == 1) { return 1; } // 1이면 그대로 리턴.
//    if (self.globalResult > 500) {
//        self.globalResult = -1;
//        return 1;
//    } //재귀의 늪에 빠지기 전에 500번 넘었는지 확인, 멈춥니다.
//    
//    if (number % 2) { number = number * 3 + 1; } //짝수, 홀수에 따라서 처리.
//    
//    else { number = number / 2; }
//    
//    [self doCollatzRecursive2:number]; //재귀
//    
//    self.globalResult += 1; //처리한 후 전역변수에 1을 추가합니다.
//    
//    return number; //처리된 수를 리턴합니다.
//}

///재귀 버전
-(NSInteger)doCollatzRecursive3:(NSInteger)number count:(NSInteger)count {

    if (count > 500) { return -1; } //500회를 넘으면 재귀에서 나갑니다.
    
    if (number%2) { //홀수 시 처리 후 재귀시킵니다.
        count = [self doCollatzRecursive3:number * 3 + 1 count:count+1];
    } else { //짝수 시 처리 후 재귀시킵니다.
        count = [self doCollatzRecursive3:number / 2 count:count+1];
    }

    return count;
}



@end
