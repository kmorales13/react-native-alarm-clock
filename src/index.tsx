import { NativeModules } from 'react-native';

type AlarmClockType = {
  multiply(a: number, b: number): Promise<number>;
};

const { AlarmClock } = NativeModules;

export default AlarmClock as AlarmClockType;
