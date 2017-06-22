//
//  ViewController.m
//  iOSSchoolDay1
//
//  Created by 박종찬 on 2017. 1. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController {
@private
    BOOL isChanged;
    BOOL statusBarHidden;
}

- (IBAction)changeAction {
    
    //글씨가 변한적이 있는지 체크하고 텍스트, 배경색, 글자색, 스테이터스 바 색 등을 업데이트한다.
    
    if (isChanged) {

        [self.myLabel setText:@"Re-Changed! \n Hi Again!"];
        [self.myLabel setTextColor:[UIColor blackColor]];
        
        [self.change setTitle:@"Re-change" forState:UIControlStateNormal];
        
        [self.view  setBackgroundColor: [UIColor whiteColor]];
        
        //글씨 체크 불값을 업데이트한 후 스테이터스 바 색을 업데이트한다.
        
        isChanged = NO;
        [self setNeedsStatusBarAppearanceUpdate];

        
    } else {
        [self.myLabel setText:@"Changed!"];
        [self.myLabel setTextColor:[UIColor whiteColor]];
        
        [self.change setTitle:@"Change" forState:UIControlStateNormal];

        [self.view  setBackgroundColor: [UIColor blackColor]];

        isChanged = YES;
        [self setNeedsStatusBarAppearanceUpdate];

    }
    

}

- (IBAction)hideStatusBar:(id)sender {
    //스테이터스 바가 감추어져 있는지 확인하는 상태를 업데이트하고, 스테이터스바를 업데이트한다.
    statusBarHidden = !statusBarHidden;
    [self setNeedsStatusBarAppearanceUpdate];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //글씨와 스테이터스 바 변했는지 체크하는 값을 초기화한다.
    
    isChanged = NO;
    statusBarHidden = NO;

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    
    //글씨변화를 체크하고 그에 맞는 스테이터스 바 색을 설정에 업데이트한다.
    
    if (isChanged) {
        return UIStatusBarStyleLightContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

- (BOOL)prefersStatusBarHidden{
    
    return statusBarHidden;
}


@end
