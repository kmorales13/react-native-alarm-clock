# react-native-alarm-clock

React Native Alarm Clock helps create native system alarms for Android & iOS

## Installation

```sh
npm install react-native-alarm-clock
```

## Usage

Simply call `createAlarm` with and ISO8601 date string and a label.
Android does not support setting a specific day, it will get the hour & minute out of the passed date and use that.
iOS does supports using a specific date.

```js
import AlarmClock from "react-native-alarm-clock";

// ...

// Create an alarm at 1:55PM for next day, with the label 'My Custom Alarm'
let date = new Date();
date.setDate(date.getDate() + 1);
date.setHours(13, 55);

AlarmClock.createAlarm(date.toISOString(), 'My Custom Alarm');
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
