//
//  ViewController.m
//  SomeOtherThings
//
//  Created by 박종찬 on 2017. 3. 2..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIGestureRecognizerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *counter;
@property (weak, nonatomic) UITapGestureRecognizer *tapping;
@property NSInteger globalCount;
@property CGPoint tappedLocation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.globalCount = 0;
    
    UITapGestureRecognizer *tapping = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    tapping.delegate = self;
    [self.view addGestureRecognizer:tapping];
    
    self.tapping = tapping;
    

}

-(void)tapped:(UIViewController *)sender {
    
//    CGPoint location = [self.tapping locationInView:sender.view];
//    
//
//    CGFloat xDist = (location.x - self.tappedLocation.x); //[2]
//    CGFloat yDist = (location.y - self.tappedLocation.y); //[3]
//    CGFloat distance = sqrt((xDist * xDist) + (yDist * yDist)); //[4]
//    
//    if (distance < 50) {
//        self.globalCount ++;
//    } else {
//        self.globalCount = 1;
//    }
    
    self.counter.text = [NSString stringWithFormat:@"tap: %ld \n\n %@",self.globalCount, NSStringFromCGPoint(self.tappedLocation)];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    self.globalCount = touch.tapCount;
    self.tappedLocation = [touch locationInView:self.view];
    return YES;
}

@end
