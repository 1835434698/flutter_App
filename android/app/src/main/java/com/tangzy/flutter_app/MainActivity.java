package com.tangzy.flutter_app;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;

import org.lalic.base.AES;
import org.lalic.base.SA;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    // 获取电池电量通道
    private static final String CHANNEL = "tangzy.flutter.io/java";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
//        Log.d("LoginPage", "aes = "+getEncryptionAES("{\"username\":\"user01\",\"password\":\"123456\"}"));

        // setMethodCallHandler在此通道上接收方法调用的回调
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        // 通过methodCall可以获取参数和方法名  执行对应的平台业务逻辑即可
                        if(methodCall.method.equals("getBatteryLevel")){
                            int batteryLevel = getBatteryLevel();
                            if(batteryLevel != -1){
                                result.success(batteryLevel);
                            }else{
                                result.error("UNAVAILABLE", "Battery level not available.", null);
                            }                 //解析参数
                        }else if(methodCall.method.equals("getEncryptionAES")){                   //解析参数
                            String params = methodCall.argument("params");
                            Log.d("LoginPage", "params = "+params);
                            result.success(getEncryptionAES(params));
                        }else if(methodCall.method.equals("toPhoneHome")){
                            moveTaskToBack(true);
                        }else{
                            result.notImplemented();
                        }
                    }
                }
        );
    }

    @Override
    public void onBackPressed() {
        Log.d("LoginPage", "onBackPressed");
//        moveTaskToBack(true);
    super.onBackPressed();
    }


    /*获取电池电量*/
    private int getBatteryLevel() {
        int batteryLevel = -1;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }
    /*
    *加密
    */
    private String getEncryptionAES(String params) {
        if (TextUtils.isEmpty(params))
            return "";
        return AES.encryptAES(params, SA.AESK);
    }
}
