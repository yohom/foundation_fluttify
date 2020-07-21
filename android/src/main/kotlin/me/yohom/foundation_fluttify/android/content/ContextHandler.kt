package me.yohom.foundation_fluttify.android.content

import android.content.BroadcastReceiver
import android.content.Context
import android.content.IntentFilter
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun ContextHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.content.Context::registerReceiver" -> {
            val args = rawArgs as Map<String, Any>

            val broadcastReceiver = HEAP[args["broadcastReceiver"] as Int] as BroadcastReceiver
            val intentFilter = HEAP[args["intentFilter"] as Int] as IntentFilter

            val refId = args["refId"] as Int
            val context = HEAP[refId] as Context

            val intent = context.registerReceiver(broadcastReceiver, intentFilter)

            if (intent != null) {
                HEAP[System.identityHashCode(intent)] = intent
                methodResult.success(System.identityHashCode(intent))
            } else {
                methodResult.success(null)
            }
        }
        else -> methodResult.notImplemented()
    }
}