package com.hibapay.app.hibapay

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
class MainActivity: FlutterFragmentActivity()
{
    fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine)
    {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}