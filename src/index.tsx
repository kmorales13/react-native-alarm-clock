import { NativeModules } from 'react-native';

type AlarmClockType = {
  createAlarm(name: string, hour: number, minute: number): void;
};

const { AlarmClock } = NativeModules;

export default AlarmClock as AlarmClockType;
