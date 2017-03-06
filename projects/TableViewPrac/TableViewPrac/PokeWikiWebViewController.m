//
//  PokeWikiWebViewController.m
//  TableViewPrac
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "PokeWikiWebViewController.h"

@interface PokeWikiWebViewController ()
<WKNavigationDelegate, WKUIDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *titleLabel;


@end

@implementation PokeWikiWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.title = self.title;
    
//    WKWebViewConfiguration *webViewConf = [[WKWebViewConfiguration alloc] init];
//    
//    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:webViewConf];
//    webView.navigationDelegate = self;
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    
    [self.view addSubview:webView];
    [self.view sendSubviewToBack:webView];
    
    NSString *encodedStr = [self.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:encodedStr];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    

}
- (IBAction)dismissWebView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
