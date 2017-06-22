//
//  ViewController.m
//  ImagePickerPrac
//
//  Created by 박종찬 on 2017. 3. 2..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *destinationImageView;

@property UIImagePickerController *imagePickerController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    [imagePickerController setAllowsEditing:YES];
    imagePickerController.delegate = self;
    
    self.imagePickerController = imagePickerController;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

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
    self.destinationImageView.image = image;
    
    
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
