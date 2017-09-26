//
//  JsonUtil.h
//  Unity-iPhone
//
//  Created by Garegin Ghukasyan on 11/2/15.
//
//

#import <Foundation/Foundation.h>

@interface JsonUtil : NSObject

+ (NSString*)serialize:(NSDictionary*)dic error:(NSError*)error;

@end
