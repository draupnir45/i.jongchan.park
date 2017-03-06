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


@end

@implementation PokeWikiWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    
    [self.view addSubview:webView];
    [self.view sendSubviewToBack:webView];
    
    // URL용으로 퍼센트인코딩합니다.
    NSString *encodedStr = [self.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:encodedStr];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

- (IBAction)dismissWebView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



@end
