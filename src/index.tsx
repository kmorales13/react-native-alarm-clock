const AlarmClock = require('./NativeAlarmClock').default;

export function createAlarm(isoDate: string, name: string): void {
  AlarmClock.createAlarm(isoDate, name);
}
