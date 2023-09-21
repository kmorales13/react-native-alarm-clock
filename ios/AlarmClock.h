
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNAlarmClockSpec.h"

@interface AlarmClock : NSObject <NativeAlarmClockSpec>
#else
#import <React/RCTBridgeModule.h>

@interface AlarmClock : NSObject <RCTBridgeModule>
#endif

@end
