#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(AlarmClock, NSObject)

RCT_EXTERN_METHOD(createAlarm:(NSString*)isoDate name:(NSString*)name)

@end
