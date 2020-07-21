package me.yohom.foundation_fluttify.android.content

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun BroadcastReceiverHandler(method: String, rawArgs: Any, binaryMessenger: BinaryMessenger?, methodResult: MethodChannel.Result) {
    when (method) {
        "android.content.BroadcastReceiver::create" -> {
            val args = rawArgs as Map<String, Any>

            val receiver = object : BroadcastReceiver() {
                override fun onReceive(context: Context?, intent: Intent?) {
                    if (intent != null) {
                        HEAP[System.identityHashCode(intent)] = intent
                    }
                    if (binaryMessenger != null) {
                        MethodChannel(binaryMessenger, "android.content.BroadcastReceiver::create::Callback")
                                .invokeMethod(
                                        "Callback::android.content.BroadcastReceiver::onReceive",
                                        mapOf("intent" to if (intent == null) null else System.identityHashCode(intent))
                                )
                    }
                }
            }

            HEAP[System.identityHashCode(receiver)] = receiver

            methodResult.success(System.identityHashCode(receiver))
        }
        else -> methodResult.notImplemented()
    }
}