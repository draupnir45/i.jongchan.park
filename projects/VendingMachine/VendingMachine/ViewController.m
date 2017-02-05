//
//  ViewController.m
//  VendingMachine
//
//  Created by 박종찬 on 2017. 2. 5..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import "VendingItemBtn.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@property NSInteger price;
@property UILabel *priceLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.price = 0;
    
    CGSize frameSize = self.view.frame.size;
    
    
    //기본 배경을 설정합니다.
    [self.view setBackgroundColor:[UIColor colorWithRed:17.0/255.0 green:98.0/255.0 blue:166/255.0 alpha:1.0]];
    [self setNeedsStatusBarAppearanceUpdate];
    
    UIImageView *titleImage = [[UIImageView alloc]initWithFrame:CGRectMake (10, 20, frameSize.width-20, frameSize.height * 0.15-20)];
    [titleImage setImage:[UIImage imageNamed:@"images/title.png"]];
    [titleImage setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:titleImage];
    
    //컨테이너를 만들고, 그 프레입 사이즈를 저장합니다.
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(10, frameSize.height * 0.15, frameSize.width-20, frameSize.height * 0.84)];
    [self.view addSubview:container];
    
    
    CGSize itemsFrameSize = CGSizeMake(container.frame.size.width, (container.frame.size.height)* 3/4);
    
    VendingItemBtn *item0 = [[VendingItemBtn alloc] initWithFrame:CGRectMake(0, 0, itemsFrameSize.width/2, itemsFrameSize.height/2)];
    [item0.itemTitle setText:@"Pokemon Ball"];
    [item0.itemImage setImage:[UIImage imageNamed:@"images/item0.png"]];
    [container addSubview:item0];
    UIButton *item0Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    item0Btn.frame = item0.frame;
    [item0Btn addTarget:self
                 action:@selector(itemTouched:)
       forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:item0Btn];
    
    
    
    VendingItemBtn *item1 = [[VendingItemBtn alloc] initWithFrame:CGRectMake(itemsFrameSize.width/2, 0, itemsFrameSize.width/2, itemsFrameSize.height/2)];
    [item1.itemTitle setText:@"Berry"];
    [item1.itemImage setImage:[UIImage imageNamed:@"images/item1.png"]];
    [container addSubview:item1];
    
    UIButton *item1Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    item1Btn.frame = item1.frame;
    [item1Btn addTarget:self
              action:@selector(itemTouched:)
    forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:item1Btn];


    
    VendingItemBtn *item2 = [[VendingItemBtn alloc] initWithFrame:CGRectMake(0, itemsFrameSize.height/2, itemsFrameSize.width/2, itemsFrameSize.height/2)];
    [item2.itemTitle setText:@"Revive"];
    [item2.itemImage setImage:[UIImage imageNamed:@"images/item2.png"]];
    [container addSubview:item2];
    
    UIButton *item2Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    item2Btn.frame = item2.frame;
    [item2Btn addTarget:self
                 action:@selector(itemTouched:)
       forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:item2Btn];

    //
    VendingItemBtn *item3 = [[VendingItemBtn alloc] initWithFrame:CGRectMake(itemsFrameSize.width/2, itemsFrameSize.height/2, itemsFrameSize.width/2, itemsFrameSize.height/2)];
    [item3.itemTitle setText:@"Potion"];
    [item3.itemImage setImage:[UIImage imageNamed:@"images/item3.png"]];
    [container addSubview:item3];
    
    
    UIButton *item3Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    item3Btn.frame = item3.frame;
    [item3Btn addTarget:self
                 action:@selector(itemTouched:)
       forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:item3Btn];
    
    CGSize bottomLineSizeRef = CGSizeMake(container.frame.size.width, (container.frame.size.height) / 8);
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, itemsFrameSize.height+5, bottomLineSizeRef.width-20, bottomLineSizeRef.height-30)];
    [self.priceLabel setBackgroundColor:[UIColor blackColor]];
    [self.priceLabel.layer setCornerRadius:10.0];
    [self.priceLabel setClipsToBounds:YES];
    [self.priceLabel setTextColor:[UIColor whiteColor]];
    [self.priceLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [self.priceLabel setText:[NSString stringWithFormat:@"가격 : %ld원  ", (long)self.price]];
    [self.priceLabel setTextAlignment:NSTextAlignmentCenter];
    
    [container addSubview:self.priceLabel];
    
    UIButton *checkOut = [[UIButton alloc]initWithFrame: CGRectMake(10, itemsFrameSize.height + 5 + bottomLineSizeRef.height -15, bottomLineSizeRef.width-20, bottomLineSizeRef.height-10)];
    [checkOut setBackgroundColor:[UIColor whiteColor]];
    [checkOut setTitle:@"Check it out" forState:UIControlStateNormal];
    [checkOut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [checkOut.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [checkOut.layer setCornerRadius:10.0];
    
    [checkOut addTarget:self action:@selector(authenticateButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [container addSubview:checkOut];
    
//    [[items objectAtIndex:1] setPosition:CGPointMake(itemsFrameSize.width * 0.75, itemsFrameSize.height * 0.25)];
//    [[items objectAtIndex:2] setPosition:CGPointMake(itemsFrameSize.width * 0.25, itemsFrameSize.height * 0.75)];
//    [[items objectAtIndex:3] setPosition:CGPointMake(itemsFrameSize.width * 0.75, itemsFrameSize.height * 0.75)];
//    
    

}

//- (BOOL)prefersStatusBarHidden{
//    
//    return YES;
//}

- (UIStatusBarStyle) preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)itemTouched:(id)sender {
//    NSLog(@"Touch");
    self.price += 1000;
    [self priceLabelUpdate];
    //아이템 터치시 반응 필요!
}

- (void)priceLabelUpdate {
    [self.priceLabel setText:[NSString stringWithFormat:@"가격 : %ld원  ", (long)self.price]];
}

- (IBAction)authenticateButtonTapped:(id)sender {
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    NSString *reason = @"Please authenticate using TouchID.";
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:reason
                          reply:^(BOOL success, NSError *error) {
                              if (success) {
                                  self.price = 0;
                                  [self priceLabelUpdate];
                                  NSLog(@"Auth was OK");
                                  
                              }
                              else {
                                  //You should do better handling of error here but I'm being lazy
                                  NSLog(@"Error received: %@", error);
                              }
                          }];
    } 
    else {  
        NSLog(@"Can not evaluate Touch ID");
        self.price = 0;
        [self priceLabelUpdate];
        
    }
}



@end
