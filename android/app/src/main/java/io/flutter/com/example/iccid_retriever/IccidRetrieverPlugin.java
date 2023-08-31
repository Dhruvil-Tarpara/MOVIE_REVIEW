package com.example.iccid_retriever;

import android.content.Context;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.util.List;

public class IccidRetrieverPlugin implements FlutterPlugin, MethodCallHandler {
    private Context context;
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        context = binding.getApplicationContext();
        channel = new MethodChannel(binding.getBinaryMessenger(), "iccid_retriever");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getIccId")) {
            String iccId = getIccIdFromSubscriptionManager();
            result.success(iccId);
        } else {
            result.notImplemented();
        }
    }

    private String getIccIdFromSubscriptionManager() {
        SubscriptionManager subscriptionManager = context.getSystemService(SubscriptionManager.class);
        List<SubscriptionInfo> subscriptionInfoList = subscriptionManager.getActiveSubscriptionInfoList();
        if (subscriptionInfoList != null && subscriptionInfoList.size() > 0) {
            SubscriptionInfo subscriptionInfo = subscriptionInfoList.get(0);
            return subscriptionInfo.getIccId();
        }
        return null;
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
