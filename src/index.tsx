import { NativeModules } from 'react-native';

type AlarmClockType = {
  createAlarm(isoDate: string, name: string): void;
};

const { AlarmClock } = NativeModules;

export default AlarmClock as AlarmClockType;
