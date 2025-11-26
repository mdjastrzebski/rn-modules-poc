import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  numberToString(value: number): string;
}

export default TurboModuleRegistry.getEnforcing<Spec>('ExampleTurboModule');
