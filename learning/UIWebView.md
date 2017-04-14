# UIWebView

### info.plist
HTTPS 프로토콜은 기본적으로 허용하지만, 보안 수준이 낮은 HTTP 프로토콜을 사용하려면 허가하는 설정을 따로 주어야 한다.

- App Transport Security Settings
 - Allow Arbitrary Loads
 - Allow Arbitrary Loads in Web Contents


### URL 인코딩
영어 이외의 언어로 요청할 수 있으므로, 기본적으로 퍼센트인코딩으로 변환해 주도록 한다.

```objc
NSString *encodedStr = [self.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
```

### 구현
UI부분은 조금 더 공부 필요!
```objc
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    
    [self.view addSubview:webView];
    
    NSString *encodedStr = [self.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:encodedStr];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
```