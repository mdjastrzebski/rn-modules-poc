import type { HostComponent, ViewProps } from 'react-native';
import { codegenNativeComponent } from 'react-native';
import type { Float } from 'react-native/Libraries/Types/CodegenTypes';

export interface NativeProps extends ViewProps {
  text?: string;
  fontSize?: Float;
}

export default codegenNativeComponent<NativeProps>('SimpleText', {
  interfaceOnly: true,
}) as HostComponent<NativeProps>;
