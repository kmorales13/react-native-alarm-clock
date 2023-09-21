package com.alarmclock

import com.facebook.react.TurboReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.model.ReactModuleInfo
import com.facebook.react.module.model.ReactModuleInfoProvider
import java.util.HashMap

class AlarmClockPackage : TurboReactPackage() {
  override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? {
    return if (name == AlarmClockModule.NAME) {
      AlarmClockModule(reactContext)
    } else {
      null
    }
  }

  override fun getReactModuleInfoProvider(): ReactModuleInfoProvider {
    return ReactModuleInfoProvider {
      val moduleInfos: MutableMap<String, ReactModuleInfo> = HashMap()
      moduleInfos[AlarmClockModule.NAME] = ReactModuleInfo(
        AlarmClockModule.NAME,
        AlarmClockModule.NAME,
        false,  // canOverrideExistingModule
        false,  // needsEagerInit
        true,  // hasConstants
        false,  // isCxxModule
        true // isTurboModule
      )
      moduleInfos
    }
  }
}
