package pro.equinoxstudio.react_native_alarm_clock;

import android.content.Context;
import android.content.Intent;
import android.provider.AlarmClock;
import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class RNAlarmClockModule extends ReactContextBaseJavaModule {
    public RNAlarmClockModule(ReactApplicationContext reactContext) {
        super(reactContext);
        Log.i("RNAlarmClockModule", "AlarmModule initialized");
    }

    @Override
    public String getName() {
        return "RNAlarmClockModule";
    }

    @ReactMethod
    public void createAlarm(final String name, final int hour, final int minutes) {
        Context context = getReactApplicationContext();

        Intent i = new Intent(AlarmClock.ACTION_SET_ALARM);
        i.putExtra(AlarmClock.EXTRA_SKIP_UI, true);
        i.putExtra(AlarmClock.EXTRA_HOUR, hour);
        i.putExtra(AlarmClock.EXTRA_MINUTES, minutes);
        i.putExtra(AlarmClock.EXTRA_MESSAGE, name);
        context.startActivity(i);
    }
}
