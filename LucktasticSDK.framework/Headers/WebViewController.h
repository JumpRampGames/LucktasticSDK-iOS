//
//  WebViewController.h
//  LucktasticSDK
//
//  Created by Gog Avagyan on 6/12/17.
//  Copyright © 2017 Gog Avagyan. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "ConnectionService.h"

@interface WebViewController : UIViewController<WKScriptMessageHandler, WKNavigationDelegate>

@property(strong, nonatomic, readwrite) NSDictionary *metaData;
@property(strong, nonatomic, readwrite) NSDictionary *eventData;
@end


