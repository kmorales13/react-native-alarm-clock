import * as React from 'react';
import { StyleSheet, View, Button } from 'react-native';
import AlarmClock from 'react-native-alarm-clock';

const create = () => {
  let date = new Date();
  date.setDate(date.getDate() + 1);
  date.setHours(13, 55);

  AlarmClock.createAlarm(date.toISOString(), 'My Custom Alarm');
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
