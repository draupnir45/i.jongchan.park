//
//  DetailViewController.m
//  MyDayApp
//
//  Created by 박종찬 on 2017. 2. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DetailViewController.h"
#import "MyDay.h"
#import "EditViewController.h"

@interface DetailViewController ()
<EditViewControllerDelegate>

@property UILabel *titleLabel;
@property UITextView *contentTextView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize frameSize = self.view.frame.size;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    
    self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 0, frameSize.width-30, frameSize.height-68)];
    
    self.contentTextView.textColor = [UIColor blackColor];
    [self.contentTextView setFont:[UIFont systemFontOfSize:24 weight:0.0]];
    self.contentTextView.editable = NO;
    self.contentTextView.scrollEnabled = YES;
    [self.view addSubview:self.contentTextView];
    
    
    
    
    [self.view addSubview:self.titleLabel];
    
    [self updateContents];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditSegue"]) {
        EditViewController *editViewController = segue.destinationViewController;
        editViewController.day = self.day;
        editViewController.delegate = self;
        [editViewController setEditViewStatus:MyDayEditViewStatusEditing];
    }
}

-(void)updateContents {
    self.contentTextView.text = self.day.content;
    self.title = self.day.title;
}

-(void)editViewWillDoneEditing:(EditViewController *)editViewController {
    if (editViewController.editViewStatus == MyDayEditViewStatusEditing) {
        self.day = editViewController.day;
        [self updateContents];
    }

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
