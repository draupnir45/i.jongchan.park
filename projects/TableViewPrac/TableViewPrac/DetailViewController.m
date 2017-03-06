//
//  DetailViewController.m
//  TableViewPrac
//
//  Created by 박종찬 on 2017. 2. 16..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "DetailViewController.h"
#import "PokeWikiWebViewController.h"

@interface DetailViewController ()

@property UIImageView *bigImage;
@property UIButton *closeButton;
//@property UITextView *descriptionView;
//@property UILabel *titleLabel;

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
    
    
    
    
//    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, frameSize.width, 100)];
//    [self.titleLabel setFont:[UIFont systemFontOfSize:40 weight:0.5]];
//    [self.titleLabel setTextColor:[UIColor blackColor]];
//    [self.titleLabel setText:self.name];
//    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
//    [self.view addSubview:self.titleLabel];
    
    
//    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(frameSize.width - 120, frameSize.height - 55, 100, 40)];
//    [self.closeButton setBackgroundColor:[UIColor blackColor]];
//    [self.closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [self.closeButton.layer setCornerRadius:20];
//    [self.closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self.closeButton setTitle:@"닫기" forState:UIControlStateNormal];
//    
//    [self.view addSubview:self.closeButton];
    
    // Do any additional setup after loading the view.
}
//- (IBAction)openWiki:(id)sender {
//    
//    PokeWikiWebViewController *webView = [[PokeWikiWebViewController alloc] init];
//    webView.urlString = @"http://ko.pokemon.wikia.com/wiki/이상해씨/";
//    [self presentViewController:webView animated:YES completion:nil];
//    
//}

-(void)viewWillAppear:(BOOL)animated {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)closeButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"webViewSegue"]) {
        UINavigationController *navi = segue.destinationViewController;
        PokeWikiWebViewController *webView = (PokeWikiWebViewController *)navi.topViewController;
        
        NSString *urlString = [NSString stringWithFormat:@"http://ko.pokemon.wikia.com/wiki/%@ (포켓몬)",self.title];
        webView.title = [NSString stringWithFormat:@"%@(포켓몬위키)",self.title];
        webView.urlString = urlString;
        
    }
    
}

@end
