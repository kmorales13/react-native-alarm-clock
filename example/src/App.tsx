import * as React from 'react';
import { StyleSheet, View, Button } from 'react-native';
import AlarmClock from 'react-native-alarm-clock';

const create = () => {
  AlarmClock.createAlarm('My Custom Alarm', 13, 55);
};

export default function App() {
  return (
    <View style={styles.container}>
      <Button title="Create Alarm at 1:55PM" onPress={() => create()} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
