//
//  DetailViewController.m
//  TabNavAndView
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DetailViewController.h"
#import "PokeWikiWebViewController.h"

@interface DetailViewController ()

@property UIImageView *bigImage;
@property UIButton *closeButton;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize frameSize = self.view.frame.size;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(frameSize.width * 1 / 6, 120, frameSize.width * 2 / 3, frameSize.width * 2 / 3)];
    [self.bigImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"images/%ld.png",self.pokemonIndex]]];
    [self.view addSubview:self.bigImage];
    
    self.descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(15, (self.bigImage.frame.origin.y + frameSize.width * 2 / 3 + 50), frameSize.width -30, frameSize.height - (self.bigImage.frame.origin.y + frameSize.width * 2 / 3 + 50))];
    self.descriptionView.text = self.contentsForPm;
    self.descriptionView.textColor = [UIColor blackColor];
    [self.descriptionView setFont:[UIFont systemFontOfSize:20  weight:0.0]];
    self.descriptionView.editable = NO;
    self.descriptionView.scrollEnabled = YES;
    
    
    [self.view addSubview:self.descriptionView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)closeButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"webViewSegue"]) {
        PokeWikiWebViewController *webView = segue.destinationViewController;
        NSString *urlString = @"http://ko.pokemon.wikia.com/wiki/이상해씨/";
        
        webView.urlString = urlString;
        
    }
    
    
    
    
}

@end
