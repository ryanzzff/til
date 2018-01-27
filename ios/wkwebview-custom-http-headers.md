# WKWebView set custom HTTP headers

To set HTTP headers before the webview navigate to a new page, just cancel the existing request and load a new request:

```objc
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSString *headerField = @"Authorization";
    NSString *headerValue = [NSString stringWithFormat:@"Bearer %@", accessToken];
        
    if([[navigationAction.request valueForHTTPHeaderField:headerField] isEqualToString:headerValue]) {
        decisionHandler(WKNavigationActionPolicyAllow);
    } else {
        NSMutableURLRequest *newRequest = [[NSMutableURLRequest alloc] initWithURL:navigationAction.request.URL];
        [newRequest setValue:headerValue forHTTPHeaderField:headerField];

        decisionHandler(WKNavigationActionPolicyCancel);
        [self.webView loadRequest:newRequest];
    }
}
```

## Problem

This method is not working for POST request, as `navigationAction.request.HTTPBody` is always `nil`

### Solution

1. Use Javascript to send POST request with custom HTTP headers
2. Call Javascript function from Native call `- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void (^ _Nullable)(_Nullable id, NSError * _Nullable error))completionHandler;`

## References

- [WKWebView ignores NSURLRequest body | Apple Developer Forums](https://forums.developer.apple.com/thread/18952)
- [解决WKWebView加载POST请求无法发送参数问题](https://www.jianshu.com/p/403853b63537)
- [Bug 167131 - It's not possible to perform a POST request with HTTPBody content in a WKWebView](https://bugs.webkit.org/show_bug.cgi?id=167131)
- [Can't set headers on my WKWebView POST request | StackOverflow](https://stackoverflow.com/questions/26253133/cant-set-headers-on-my-wkwebview-post-request)
