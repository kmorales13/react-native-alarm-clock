
# react-native-alarm-clock

## Getting started

`$ npm install react-native-alarm-clock --save`
or
`$ yarn add react-native-alarm-clock`

### Automatic installation

`$ react-native link react-native-alarm-clock`

### Manual installation

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.liang.RNAlarmClockPackage;` to the imports at the top of the file
  - Add `new RNAlarmClockPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-alarm-clock'
  	project(':react-native-alarm-clock').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-alarm-clock/android')
  	```
3. Append the following line inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-alarm-clock')
  	```


## Usage
```javascript
import RNAlarmClock from 'react-native-alarm-clock';

// Creates an alarm with the TAG iDream at 17:30 hrs.
RNAlarmClock.createAlarm('iDream', 17, 30);
```
  
