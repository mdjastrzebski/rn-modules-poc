/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import { StatusBar, StyleSheet, Text, useColorScheme } from 'react-native';
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
  return (
    <SafeAreaView style={styles.container}>
      <Text>Native Module Test: {ExampleTurboModule.numberToString(123)}</Text>
      <SimpleText style={styles.simpleText} text="Hello, World!" />
      <Text>End</Text>
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
    minHeight: 6,
  },
});

export default App;
