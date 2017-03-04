//
//  ViewController.m
//  CalcCopy
//
//  Created by 박종찬 on 2017. 3. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "CalcButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CalcButton *zero;
@property (weak, nonatomic) IBOutlet CalcButton *one;
@property (weak, nonatomic) IBOutlet CalcButton *two;
@property (weak, nonatomic) IBOutlet CalcButton *three;
@property (weak, nonatomic) IBOutlet CalcButton *four;
@property (weak, nonatomic) IBOutlet CalcButton *five;
@property (weak, nonatomic) IBOutlet CalcButton *six;
@property (weak, nonatomic) IBOutlet CalcButton *seven;
@property (weak, nonatomic) IBOutlet CalcButton *eight;
@property (weak, nonatomic) IBOutlet CalcButton *nine;

@property (weak, nonatomic) IBOutlet CalcButton *allClear;
@property (weak, nonatomic) IBOutlet CalcButton *signConvert;
@property (weak, nonatomic) IBOutlet CalcButton *percentize;

@property (weak, nonatomic) IBOutlet CalcButton *divide;
@property (weak, nonatomic) IBOutlet CalcButton *multiply;
@property (weak, nonatomic) IBOutlet CalcButton *minus;
@property (weak, nonatomic) IBOutlet CalcButton *plus;
@property (weak, nonatomic) IBOutlet CalcButton *equal;

@property (weak, nonatomic) IBOutlet UIButton *dot;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property NSArray *numberBtnArray;
@property NSArray *priorityBtnOperator;
@property NSArray *updateBtnOperator;

@property NSNumber *result;

@property NSMutableArray *numberBuffer;
@property NSMutableArray *operatorBuffer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    self.numberBtnArray = @[_zero, _one, _two, _three, _four, _five, _six, _seven, _eight, _nine];
    self.priorityBtnOperator = @[_divide, _multiply];
    self.updateBtnOperator = @[_plus, _minus, _equal];

    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberInserted:(CalcButton *)sender {
    
    if ([self.resultLabel.text  isEqual: @"0"] && ![sender.currentTitle  isEqual: @"."]) {
        self.resultLabel.text = @"";
    }
    
    self.resultLabel.text = [self.resultLabel.text stringByAppendingString:sender.titleLabel.text];
}

- (IBAction)allClearBtnSelected:(id)sender {
    self.resultLabel.text = @"0";
}

- (IBAction)operatorInserted:(CalcButton *)sender {
    
    [sender.layer setBorderWidth:2.0];
    [sender setHighlighted:YES];
    
    
    if (self.numberBuffer.count == self.operatorBuffer.count) {
        [self.numberBuffer addObject:self.resultLabel.text];
    } else if (self.numberBuffer.count > self.operatorBuffer.count) {
        
        if ([self.updateBtnOperator containsObject:sender]) {
            [self updateResult];
        } else {
            [self.operatorBuffer addObject:sender.currentTitle];
        }
        
    }
    
}

-(void)updateResult {
    
}


@end
