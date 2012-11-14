//
//  WebViewController.m
//  ASUClasses
//
//  Created by redoughe on 10/26/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "WebViewController.h"
#import "ASUViewController.h"

@implementation WebViewController

@synthesize webView = _webView;
@synthesize url = _url;
//@synthesize activityIndicator = _activityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
/*	CGRect bounds = [[UIScreen mainScreen] applicationFrame];
//	self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//	self.view = activityIndicator;
	self.webView = [[UIWebView alloc]initWithFrame:bounds];
	self.webView.delegate = self;*/
    NSURL *url = [NSURL URLWithString:self.url];
	NSLog(@"Got URL: %@", self.url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

/*- (void)webViewDidStartLoad:(UIWebView *)webView {
	[activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[activityIndicator stopAnimating];
	self.view = self.webView;
}*/

@end
