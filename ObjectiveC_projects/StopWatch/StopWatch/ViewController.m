//
//  ViewController.m
//  StopWatch
//
//  Created by 박종찬 on 2017. 3. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "JCDateManager.h"

@interface ViewController ()

@property NSThread *myFirstThreadMan;
@property NSDate *startTime;
@property NSString *stringToTimer;
@property NSDate *legacyDate;
@property NSInteger miliSec;
@property dispatch_source_t dispatch_source;
@property BOOL counting;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.dispatch_source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.dispatch_source, DISPATCH_TIME_NOW, 1 * NSEC_PER_MSEC, 0 * NSEC_PER_USEC);
    dispatch_source_set_event_handler(self.dispatch_source, ^{
        
        self.stringToTimer = [NSString stringWithFormat:@"%ld",self.miliSec++];
        self.timerLabel.text = self.stringToTimer;
        //        [self watchUpdate];
    });
    
    
//    [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];


}

- (void)threadStart {
    
    self.miliSec = 0;
    NSInteger milsecInt = [[[JCDateManager sharedInstance] stringWithDate:self.startTime format:@"SS"] integerValue];
    
    
    while (!self.myFirstThreadMan.cancelled) {
        NSDate *now = [NSDate date];
        NSInteger nowMilSec  = [[[JCDateManager sharedInstance] stringWithDate:now format:@"SS"] integerValue] + 100;
        NSInteger milSec = (nowMilSec - milsecInt) % 100;
        self.stringToTimer = [NSString stringWithFormat:@"%@:%02ld",[self stringFromTimeInterval:[now timeIntervalSinceDate:self.startTime]],milSec];
        if (self.miliSec == 100) {
            self.miliSec = 0;
        }
        [self performSelectorOnMainThread:@selector(watchUpdate) withObject:nil waitUntilDone:NO];
        usleep(10000);
    }
    


}

- (void)watchUpdate {
    
    self.timerLabel.text = self.stringToTimer;

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startTimer:(UIButton *)sender {
//    if (self.counting) {
//        
//        dispatch_suspend(self.dispatch_source);
//        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
//    } else {
//        dispatch_resume(self.dispatch_source);
//        [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
//    }
//    
//    self.counting = !self.counting;
    
    if (self.myFirstThreadMan.executing) {
        [self.myFirstThreadMan cancel];
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        self.legacyDate = self.startTime;
    } else {
        if (self.legacyDate == nil) {
            self.startTime = [NSDate date];
        }
        
        self.myFirstThreadMan = [[NSThread alloc] initWithTarget:self selector:@selector(threadStart) object:nil];
        
        
        [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
        [self.myFirstThreadMan start];
    }
    
//    dispatch_queue_t my_queue = dispatch_queue_create("myququ", DISPATCH_QUEUE_SERIAL);


    
}

- (IBAction)resetTimer:(id)sender {
    
    self.miliSec = 0;
    self.startTime = nil;
    self.legacyDate = nil;
    [self.myFirstThreadMan cancel];
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    [self.timerLabel setText:@"00:00:00:00"];
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}

@end
