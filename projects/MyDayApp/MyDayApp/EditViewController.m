//
//  EditViewController.m
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "EditViewController.h"
#import "MyDay.h"

@interface EditViewController ()


@property UITextView *editableTextView;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
//@property NSInteger editViewStatus;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize frameSize = self.view.frame.size;
    
//    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(frameSize.width - 30, frameSize.height-20)];
    
    self.editableTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 68, frameSize.width-30, frameSize.height-68)];
    [self.editableTextView insertText:self.day.content];
    self.editableTextView.textColor = [UIColor blackColor];
    [self.editableTextView setFont:[UIFont systemFontOfSize:24 weight:0.0]];

    [self.view addSubview:self.editableTextView];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy. MM. dd.";
    
    if (self.editViewStatus == MyDayEditViewStatusEditing) {
        self.dateLabel.text = [dateFormatter stringFromDate:self.day.writtenDate];
//            [self.editableTextView insertText: self.day.content];

    } else if (self.editViewStatus == MyDayEditViewStatusAdding) {
        NSDate *today = [NSDate date];
        self.dateLabel.text = [dateFormatter stringFromDate:today];
    }
//    [self.editableTextView becomeFirstResponder];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editingDone:(UIButton *)sender {
    self.day = [[MyDay alloc] init];
    self.day.content = self.editableTextView.text;
    self.day.title = @"타이틀 끊기 준비중";
    self.day.writtenDate = [NSDate date];
    [self.delegate editViewWillDoneEditing:self];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)cancelEditing:(UIButton *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
