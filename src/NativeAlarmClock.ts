import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  createAlarm(isoDate: string, name: string): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('AlarmClock');
