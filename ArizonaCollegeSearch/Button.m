//
//  Button.m
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/10/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "Button.h"

@implementation Button

@synthesize button = _button;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.button.layer setCornerRadius:8.0f];
		[self.button.layer setMasksToBounds:YES];
		[self.button.layer setBorderWidth:1.0f];
		[self.button.layer setBackgroundColor:[[UIColor redColor] CGColor]];
		[self.button setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
