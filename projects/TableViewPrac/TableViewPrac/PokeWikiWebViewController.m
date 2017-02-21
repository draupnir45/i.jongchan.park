//
//  PokeWikiWebViewController.m
//  TableViewPrac
//
//  Created by 박종찬 on 2017. 2. 21..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "PokeWikiWebViewController.h"

@interface PokeWikiWebViewController ()
<WKNavigationDelegate>


@end

@implementation PokeWikiWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration *webViewConf = [[WKWebViewConfiguration alloc] init];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:webViewConf];
    webView.navigationDelegate = self;
    
    NSURL *url = [NSURL URLWithString:self.urlString];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    
    [self.view addSubview:webView];

    
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


@end
