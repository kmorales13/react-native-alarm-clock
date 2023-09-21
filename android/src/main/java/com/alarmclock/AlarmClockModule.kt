package com.alarmclock

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = AlarmClockModule.NAME)
class AlarmClockModule(reactContext: ReactApplicationContext) :
  NativeAlarmClockSpec(reactContext) {

  override fun getName(): String {
    return NAME
  }

  override fun createAlarm(isoDate: String, name: String) {
    try {
      val tz = TimeZone.getTimeZone("UTC")
      val df1: DateFormat = SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
      df1.timeZone = tz;
      val date: Date = df1.parse(isoDate)

      val i = Intent(AlarmClock.ACTION_SET_ALARM)
      i.putExtra(AlarmClock.EXTRA_SKIP_UI, true)
      i.putExtra(AlarmClock.EXTRA_MESSAGE, name)
      i.putExtra(AlarmClock.EXTRA_HOUR, date.hours)
      i.putExtra(AlarmClock.EXTRA_MINUTES, date.minutes)

      currentActivity?.startActivity(i)
    } catch (e: Exception) {
      e.printStackTrace()
      Log.e("[RNAlarmClock]", "Error creating reminder")
      return
    }

    Log.i("[RNAlarmClock]", "Reminder created")
  }

  companion object {
    const val NAME = "AlarmClock"
  }
}
