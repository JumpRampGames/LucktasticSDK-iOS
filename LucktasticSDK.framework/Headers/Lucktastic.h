//
//  LucktasticSDK.h
//  LucktasticSDK
//
//  Created by Gog Avagyan on 6/16/17.
//  Copyright © 2017 Gog Avagyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebViewController.h"
#import "JsonUtil.h"
#import "AdCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "ErrorUtil.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "DeviceInfo.h"
#import "TimeUtil.h"


static NSString * _Nonnull AdCellIdentifier = @"adCell";

@interface Lucktastic : NSObject<CellClickDelegate>

/**
 InitWithAppId description.

 @param appId   - Your application id.
 @param options - User information.
 @param success - Called when init function is completed successfuly.
 @param failure - Called when there is parsing error or error from the server response.
 */
+(void)initWithAppId:(NSString *_Nullable)appId options:(nullable NSDictionary *)options success:(void(^_Nullable)())success failure:(nullable void (^) ( NSError * _Nullable error ))failure;

/**
 RequestAdWithPlacementId description.

 @param placementId   - Ad placement id
 @param success       - Called when init function is completed successfuly.
 @param failure       - Called when there is parsing error or error from the server response.
 @return return value - Returned AdCell UITableviewCell with ad information. If the Server API returns "show_ad": false, then an empty AdCell would be returned with height 0.
 */
+(AdCell *_Nullable)requestAdWithPlacementId:(NSString *_Nullable)placementId success:(nullable void(^) (AdCell * _Nullable adCell))success failure:(nullable void (^) (NSError * _Nullable error))failure;

@end
