#import "AlarmClock.h"
#import <EventKit/EventKit.h>

@implementation AlarmClock
RCT_EXPORT_MODULE()

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (void)createAlarm:(NSString *)isoDate name:(NSString *)name {
    NSLocale *userLocale = [NSLocale currentLocale];
    NSDateFormatter *iso8601Formatter = [[NSDateFormatter alloc] init];
    iso8601Formatter.locale = userLocale;
    iso8601Formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    iso8601Formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDate *date = [iso8601Formatter dateFromString:isoDate];

    if (!date) {
        return;
    }

    EKEventStore *eventStore = [[EKEventStore alloc] init];
    [eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
        if (granted && !error) {
            EKReminder *reminder = [EKReminder reminderWithEventStore:eventStore];
            reminder.title = name;

            EKAlarm *alarm = [[EKAlarm alloc] initWithAbsoluteDate:date];
            [reminder addAlarm:alarm];

            reminder.calendar = eventStore.defaultCalendarForNewReminders;

            NSError *saveError = nil;
            [eventStore saveReminder:reminder commit:YES error:&saveError];

            if (saveError) {
                NSLog(@"Error creating reminder: %@", saveError);
                return;
            }

            NSLog(@"Reminder created");
        }
    }];
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeAlarmClockSpecJSI>(params);
}
#endif

@end
