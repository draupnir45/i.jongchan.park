//
//  EditViewController.m
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "EditViewController.h"
#import "MyDay.h"
#import "CoreDataController.h"

@interface EditViewController ()
<UITextViewDelegate>


@property UITextView *editableTextView;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property CoreDataController *dataController;



@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize frameSize = self.view.frame.size;
    
//    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(frameSize.width - 30, frameSize.height-20)];
    self.dataController = [[CoreDataController alloc] init];
    
    self.editableTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 68, frameSize.width-30, frameSize.height-68)];
    self.editableTextView.textColor = [UIColor blackColor];
    [self.editableTextView setFont:[UIFont systemFontOfSize:24 weight:0.0]];
    self.editableTextView.delegate = self;
    self.editableTextView.scrollEnabled = YES;

    [self.view addSubview:self.editableTextView];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy. MM. dd.";
    
    if (self.editViewStatus == MyDayEditViewStatusEditing) {
        self.dateLabel.text = [dateFormatter stringFromDate:self.day.writtenDate];
        [self.editableTextView insertText:self.day.content];

    } else if (self.editViewStatus == MyDayEditViewStatusAdding) {
        NSDate *today = [NSDate date];
        self.dateLabel.text = [dateFormatter stringFromDate:today];
    }
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewFrameChange:) name:UIKeyboardDidShowNotification object:nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editingDone:(UIButton *)sender {

    if (self.editViewStatus == MyDayEditViewStatusAdding) {
        self.day = [[MyDay alloc] init];
        self.day.writtenDate = [NSDate date];
    }
    
    self.day.content = self.editableTextView.text;
    self.day.title = @"타이틀 끊기 준비중";
    [self.dataController saveMyDayItem:self.day];
    [self.delegate editViewWillDoneEditing:self];
    [self dismissViewControllerAnimated:YES completion:nil];

    
}

- (IBAction)cancelEditing:(UIButton *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)textViewDidChange:(UITextView *)textView {
    [textView scrollRangeToVisible:[textView selectedRange]];
}

-(void)textViewFrameChange:(NSNotification *)notification {
    
    CGRect keyboardFrame =  [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    [self.editableTextView setFrame:CGRectMake(15, 68, self.view.frame.size.width-30, self.view.frame.size.height-68 - keyboardFrame.size.height)];
    
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
