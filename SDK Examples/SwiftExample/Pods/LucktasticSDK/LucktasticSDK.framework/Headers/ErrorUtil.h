//
//  ErrorUtil.h
//  LucktasticSDK
//
//  Created by Gog on 7/7/17.
//  Copyright © 2017 Gog Avagyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lucktastic.h"

@interface ErrorUtil : NSObject
+(NSError*) serverErrorToNSError:(NSDictionary*)error;
@end
