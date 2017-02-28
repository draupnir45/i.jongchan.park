//
//  LoginViewController.m
//  BiblyPlay
//
//  Created by 박종찬 on 2017. 2. 24..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "LoginViewController.h"
#import "DataCenter.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userIDTf;
@property (weak, nonatomic) IBOutlet UITextField *pwTf;
@property (weak, nonatomic) IBOutlet UIImageView *background;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
}

-(void)viewDidAppear:(BOOL)animated {
    UIBlurEffect *blurrEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
    
    UIVisualEffectView *effcetView = [[UIVisualEffectView alloc] initWithEffect:blurrEffect];
    effcetView.frame = self.view.bounds;
            [_background addSubview:effcetView];
    [effcetView setAlpha:0.0];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{

        
        [effcetView setAlpha:1.0];

    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signInSelected:(id)sender {
    NSMutableDictionary *userInfos = [[DataCenter sharedData] userInfos];
    if ([[userInfos objectForKey:self.userIDTf.text]isEqualToString:self.pwTf.text]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"틀림요"
                                                                       message:@"아니 걸 기억을 못해서 틀리고 그래요?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"아 진짜" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];

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
