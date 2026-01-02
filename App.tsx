/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import * as React from 'react';
import {
  Pressable,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
} from 'react-native';
import { SafeAreaProvider, SafeAreaView } from 'react-native-safe-area-context';

import ExampleTurboModule from './specs/NativeExampleTurboModule';
import SimpleText from './specs/SimpleTextNativeComponent';

function App() {
  const isDarkMode = useColorScheme() === 'dark';

  return (
    <SafeAreaProvider>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <AppContent />
    </SafeAreaProvider>
  );
}

function AppContent() {
  const [text, setText] = React.useState('Hello World!');

  return (
    <SafeAreaView style={styles.container}>
      <Text>Native Module Test: {ExampleTurboModule.numberToString(123)}</Text>
      <SimpleText style={styles.simpleText} text={text} fontSize={24} />
      <Text>End</Text>

      <Pressable
        style={styles.button}
        onPress={() => {
          setText(t => t + '!');
        }}
      >
        <Text>Change Text</Text>
      </Pressable>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'stretch',
  },
  simpleText: {
    backgroundColor: 'red',
    padding: 10,
  },
  button: {
    padding: 10,
    backgroundColor: 'lightblue',
    alignItems: 'center',
    justifyContent: 'center',
    margin: 10,
    alignSelf: 'center',
  },
});

export default App;
