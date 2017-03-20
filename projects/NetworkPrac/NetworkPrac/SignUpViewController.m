//
//  SignUpViewController.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "SignUpViewController.h"
#import "DataCenter.h"
#import "JCAlertController.h"
#import "JCFullScreenActivityIndicatorView.h"

@interface SignUpViewController ()
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *password1TextField;
@property (weak, nonatomic) IBOutlet UITextField *password2TextField;

@property JCFullScreenActivityIndicatorView *indicatorView;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //인디케이터뷰
    self.indicatorView = [[JCFullScreenActivityIndicatorView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView *textField in self.view.subviews){
        if ([textField isKindOfClass:[UITextField class]] && [textField isFirstResponder]) {
            [textField resignFirstResponder];
        }
    }
}

#warning server always throw success

- (IBAction)signUp:(id)sender {
    
    [self.userNameTextField resignFirstResponder];
    [self.password1TextField resignFirstResponder];
    [self.password2TextField resignFirstResponder];
    
    [self.indicatorView startIndicatorOnView:self.view];
    
    if (self.userNameTextField.text.length == 0 || self.userNameTextField.text.length == 0 || self.userNameTextField.text.length == 0) {
        
        [self.indicatorView stopIndicator];
        [self presentViewController:[JCAlertController alertControllerWithTitle:@"필수 항목이 빠졌습니다." message:@"아이디, 비밀번호를 모두 넣어 주세요." preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"확인"] animated:YES completion:nil];
        
    } else if (![self.password1TextField.text isEqualToString:self.password2TextField.text]) {
        
        [self.indicatorView stopIndicator];
        [self presentViewController:[JCAlertController alertControllerWithTitle:@"비밀번호가 다릅니다!" message:@"비밀번호와 비밀번호 확인 란에 같은 비밀번호를 넣어 주세요." preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"확인"] animated:YES completion:^{
            [self.password2TextField becomeFirstResponder];
        }];
        
    } else {
    
        [[DataCenter sharedData] signUpRequestWithUserName:self.userNameTextField.text password:self.password1TextField.text completion:^(BOOL sucess, NSDictionary *dataDict) {
            NSUInteger resultCode = 100;
            
            if (sucess) {
                resultCode = JCNetworkSignUpResponseOK;
            } else {
                resultCode = JCNetworkSignUpResponseUserNameAlreadyTaken;
            }
            
            dispatch_queue_t mainqueue = dispatch_get_main_queue();
            
            dispatch_sync(mainqueue, ^{
                [self.indicatorView stopIndicator];
                [self alertWithResult:resultCode];

            });
            
            
        }];
    }
    
}


- (void)alertWithResult:(NSUInteger)result {
    
    
    switch (result) {
        case JCNetworkSignUpResponseOK:
        {
            JCAlertController *alert = [JCAlertController alertControllerWithTitle:@"회원가입 성공" message:@"환영합니다!" preferredStyle:UIAlertControllerStyleAlert actionTitle:@"확인" handler:^(UIAlertAction *action) {
                [self goBackToMainVC];
            }];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
            break;
            
        case JCNetworkSignUpResponsePasswordNotStaisfying:
        {
            JCAlertController *alert = [JCAlertController alertControllerWithTitle:@"비밀번호 오류" message:@"8자 이상, 영문자와 숫자의 조합이되 너무 간단하지 않도록 해 주세요." preferredStyle:UIAlertControllerStyleAlert actionTitle:@"확인" handler:^(UIAlertAction *action) {
                [self.password1TextField becomeFirstResponder];
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
            
        case JCNetworkSignUpResponseUserNameAlreadyTaken:
        {
            JCAlertController *alert = [JCAlertController alertControllerWithTitle:@"ID 오류" message:@"이미 있는 아이디입니다." preferredStyle:UIAlertControllerStyleAlert actionTitle:@"확인" handler:^(UIAlertAction *action) {
                [self.userNameTextField becomeFirstResponder];
            }];
            [self presentViewController:alert animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
    
    
    
}


- (void)goBackToMainVC {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
