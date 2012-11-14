//
//  WebViewController.h
//  ASUClasses
//
//  Created by redoughe on 10/26/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) NSString *url;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
