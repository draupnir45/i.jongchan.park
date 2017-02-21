//
//  PokeWikiWebViewController.m
//  TabNavAndView
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
    
    //    WKWebViewConfiguration *webViewConf = [[WKWebViewConfiguration alloc] init];
    //
    //    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:webViewConf];
    //    webView.navigationDelegate = self;
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    
    [self.view addSubview:webView];
    
    NSString *encodedStr = [self.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:encodedStr];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}


@end
