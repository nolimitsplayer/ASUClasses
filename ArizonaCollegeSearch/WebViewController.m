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
@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.url];
	NSLog(@"Got URL: %@", self.url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
