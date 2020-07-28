import EventKit


extension DateFormatter {
    static let iso8601DateFormatter: DateFormatter = {
        let enUSPOSIXLocale = Locale(identifier: "en_US_POSIX")
        let iso8601DateFormatter = DateFormatter()
        iso8601DateFormatter.locale = enUSPOSIXLocale
        iso8601DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        iso8601DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return iso8601DateFormatter
    }()
    
    static let iso8601WithoutMillisecondsDateFormatter: DateFormatter = {
        let enUSPOSIXLocale = Locale(identifier: "en_US_POSIX")
        let iso8601DateFormatter = DateFormatter()
        iso8601DateFormatter.locale = enUSPOSIXLocale
        iso8601DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        iso8601DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return iso8601DateFormatter
    }()
    
    static func date(fromISO8601String string: String) -> Date? {
        if let dateWithMilliseconds = iso8601DateFormatter.date(from: string) {
            return dateWithMilliseconds
        }
        
        if let dateWithoutMilliseconds = iso8601WithoutMillisecondsDateFormatter.date(from: string) {
            return dateWithoutMilliseconds
        }
        
        return nil
    }
}

@objc(AlarmClock)
class AlarmClock: NSObject {

    @objc func createAlarm(_ isoDate: String, name: String?) -> Void {
        if let date = DateFormatter.date(fromISO8601String: isoDate) {
            let eventStore = EKEventStore();
            eventStore.requestAccess(to: EKEntityType.reminder, completion: {
                granted, error in
                if (granted) && (error == nil) {
                    let reminder:EKReminder = EKReminder(eventStore: eventStore)
                    reminder.title = name
                    
                    let alarm = EKAlarm(absoluteDate: date)
                    reminder.addAlarm(alarm)

                    reminder.calendar = eventStore.defaultCalendarForNewReminders()
                    
                    do {
                        try eventStore.save(reminder, commit: true)
                    } catch {
                        print("Error creating reminder: \(error)")
                        return
                    }
                    
                    print("Reminder created")
                }
            })
        }
    }
}
