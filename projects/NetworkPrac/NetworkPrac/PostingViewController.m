//
//  PostingViewController.m
//  NetworkPrac
//
//  Created by 박종찬 on 2017. 3. 15..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "PostingViewController.h"
#import "DataCenter.h"
#import "PostModel.h"
#import "JCActivityIndicatorView.h"
#import "JCAlertController.h"

@interface PostingViewController ()
<UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@property JCActivityIndicatorView *indicatorView;
@property UIImagePickerController *imagePickerController;
@property NSData *imageData;



@end

@implementation PostingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //인디케이터뷰
    self.indicatorView = [[JCActivityIndicatorView alloc] init];
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    [imagePickerController setAllowsEditing:YES];
    imagePickerController.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowsUp:) name:UIKeyboardFrameBeginUserInfoKey object:nil];
    self.imagePickerController = imagePickerController;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textViewDidChange:(UITextView *)textView {
    [textView scrollRangeToVisible:[textView selectedRange]];
}


#pragma mark - Image

- (IBAction)imagePicker:(id)sender {
    
    if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {//후면 카메라가 있는지를 확인
        
        UIAlertController *photoPickingActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet]; //카메라와 사진 라이브러리를 위한 액션시트 할당
        
        
        UIAlertAction *cameraOpen = [UIAlertAction actionWithTitle:@"카메라 열기" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }]; //카메라를 여는 액션 작성
        
        
        
        UIAlertAction *photoLibOpen = [UIAlertAction actionWithTitle:@"사진 라이브러리에서 불러오기" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }]; //라이브러리를 여는 액션 작성
        
        
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil]; //취소 액션
        
        [photoPickingActionSheet addAction:cameraOpen];
        [photoPickingActionSheet addAction:photoLibOpen];
        [photoPickingActionSheet addAction:cancel];
        
        [self presentViewController:photoPickingActionSheet animated:YES completion:nil]; //액션시트 보여주기
    } else {
        
        //카메라가 없는 경우 바로 라이브러리 켜기
        
        [self.imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }
    
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    self.imageData = UIImageJPEGRepresentation(image, 0.1);
    self.imageView.image = image;
    self.imageView.hidden = NO;


    
}

- (UIImage *) scaleImage:(UIImage*)image toSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - Upload

- (IBAction)upload:(id)sender {
    
    [self.indicatorView startIndicatorOnView:self.view];
    
    [[DataCenter sharedData] postTitle:self.titleTextField.text content:self.contentTextView.text imageData:self.imageData completion:^(BOOL sucess, NSDictionary *dataDict) {
        dispatch_queue_t main_queue = dispatch_get_main_queue();
        if (sucess) {
            
            dispatch_sync(main_queue, ^{
                [self.indicatorView stopIndicator];
                [self presentViewController:[JCAlertController alertControllerWithTitle:@"포스트 성공!" message:nil preferredStyle:UIAlertControllerStyleAlert actionTitle:@"확인" handler:^(UIAlertAction *action) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }] animated:YES completion:nil];
                
            });
        } else {
            dispatch_sync(main_queue, ^{
                [self.indicatorView stopIndicator];
                [self presentViewController:[JCAlertController alertControllerWithTitle:@"업로드에 실패했습니다." message:@"다시 시도해 주세요." preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"확인"] animated:YES completion:nil];
            });
        }
    }];
    
}


- (void)keyboardShowsUp:(NSNotification *)notification {
    CGRect keyboardRect = [[[notification userInfo] valueForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];

    [self.toolBar setFrame:CGRectMake(0, self.view.frame.size.height - keyboardRect.size.height - self.toolBar.bounds.size.height, self.toolBar.bounds.size.width, self.toolBar.bounds.size.height)];
}





@end
