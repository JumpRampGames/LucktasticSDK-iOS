//
//  ConnectionService.h
//   
//
//
//

#ifndef ConnectionService_h
#define ConnectionService_h


#endif /* ConnectionService_h */

#import <Foundation/Foundation.h>

@interface ConnectionService : NSObject 

typedef void(^success)(NSData *data, NSURLResponse *response, NSError *error);
typedef void(^exception)(NSError *error);

+(id)sharedService;
-(void)initWithAppId:(NSString *)appId withOption:(NSDictionary *)option withCompletion: (success)completion withException:(exception) exception;
-(void)getProfileWithProfileId:(NSString *)profileId withPlacementId:(NSString *)placementId withCompletion: (success)completion;
-(void)getPrimerWithAppId:(NSString *)appId withCompletion: (success)completion;
@end
