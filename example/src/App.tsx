import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import { createAlarm } from 'react-native-alarm-clock';

export default function App() {
  function createNewAlarm() {
    let date = new Date();
    date.setDate(date.getDate() + 1);
    date.setHours(13, 55);
    createAlarm(date.toISOString(), 'Custom Alarm');
  }

  return (
    <View style={styles.container}>
      <Button title="Create Alarm at 1:55PM" onPress={createNewAlarm} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
