package com.example.flutter_app_demo;

import android.os.Bundle;
import android.os.Handler;

import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StringCodec;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        BinaryMessenger binaryMessenger = getFlutterEngine().getDartExecutor().getBinaryMessenger();
        BasicMessageChannel<String> messageChannel = new BasicMessageChannel<String>(binaryMessenger, "TEST", StringCodec.INSTANCE);

        messageChannel.
                setMessageHandler(new BasicMessageChannel.MessageHandler<String>() {
                    @Override
                    public void onMessage(String s, BasicMessageChannel.Reply<String> reply) {
                        reply.reply("HELLO FLUTTER");
                    }
                });


        final Handler handler = new Handler();
        new Thread() {
            public void run() {
                handler.post(new Runnable() {
                    public void run() {
                        try {
                            sleep(1000);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                        messageChannel.send("HELLO 1 FLUTTER");
                    }
                });
            }
        }.start();

    }
}
