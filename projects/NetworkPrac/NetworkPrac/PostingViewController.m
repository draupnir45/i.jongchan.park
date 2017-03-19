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

@interface PostingViewController ()
<UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property UIImagePickerController *imagePickerController;
@property NSData *imgData;
@property (weak, nonatomic) IBOutlet UIButton *postBtn;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end

@implementation PostingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    [imagePickerController setAllowsEditing:YES];
    imagePickerController.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowsUp:) name:UIKeyboardWillShowNotification object:nil];
    
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
    UIImage *image = [self scaleImage:[info objectForKey:UIImagePickerControllerEditedImage] toSize:CGSizeMake(300, 300)];
    self.imgData = UIImageJPEGRepresentation(image, 0.1);
    self.imageView.image = image;
    self.imageView.hidden = NO;


    
}

- (UIImage *) scaleImage:(UIImage*)image toSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - Upload

- (IBAction)upload:(id)sender {
    [[DataCenter sharedData] postTitle:self.titleTextField.text content:self.textView.text imageData:self.imgData completion:^(BOOL sucess, NSDictionary *dataDict) {
        if (sucess) {
            dispatch_queue_t main_queue = dispatch_get_main_queue();
            dispatch_sync(main_queue, ^{
                [self dismissViewControllerAnimated:YES completion:nil];
            });
        }
    }];
    
}


- (void)keyboardShowsUp:(NSNotification *)notification {
    CGRect keyboardRect = [[[notification userInfo] valueForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];

    [self.toolBar setFrame:CGRectMake(0, self.view.frame.size.height - keyboardRect.size.height - self.toolBar.bounds.size.height, self.toolBar.bounds.size.width, self.toolBar.bounds.size.height)];
}





@end
