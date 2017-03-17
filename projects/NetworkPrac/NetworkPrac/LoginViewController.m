//
//  LoginViewController.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "LoginViewController.h"
#import "DataCenter.h"
#import "JCAlertController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)logIn:(id)sender {
    
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
    
    if (self.userName.text.length == 0 || self.userName.text.length == 0 || self.userName.text.length == 0) {
        [self presentViewController:[JCAlertController alertControllerWithTitle:@"필수 항목이 빠졌습니다." message:@"아이디, 비밀번호를 모두 넣어 주세요." preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"확인"] animated:YES completion:nil];
    } else {
        
        [[DataCenter sharedData] loginRequestWithUserName:self.userName.text password:self.password.text completion:^(BOOL sucess, NSDictionary *dataDict) {
            
            NSUInteger resultCode = 100;
            
            if ([dataDict objectForKey:@"key"]) {
                resultCode = JCNetworkLogInResponseOK;
            } else if ([[dataDict objectForKey:@"non_field_errors"] count] > 0) {
                resultCode = JCNetworkLogInResponseFailed;
            } else {
                NSLog(@"하아아아아아아아아아아아아아아아아아");
            }
            
            dispatch_queue_t mainqueue = dispatch_get_main_queue();
            
            dispatch_sync(mainqueue, ^{
                [self actionWithResult:resultCode];
            });
            
            
        }];
    }
}

- (void)actionWithResult:(NSUInteger)result {
    
    switch (result) {
        case JCNetworkLogInResponseOK:
        {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
            break;
            
        case JCNetworkLogInResponseFailed:
        {
            JCAlertController *alert = [JCAlertController alertControllerWithTitle:@"로그인 실패" message:@"로그인 정보를 확인해 주세요!" preferredStyle:UIAlertControllerStyleAlert actionTitle:@"확인" handler:^(UIAlertAction *action) {
                [self.userName becomeFirstResponder];
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
            
        default:
            break;
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
