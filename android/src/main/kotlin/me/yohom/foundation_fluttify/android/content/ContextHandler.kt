package me.yohom.foundation_fluttify.android.content

import android.content.BroadcastReceiver
import android.content.Context
import android.content.IntentFilter
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.core.__this__
import me.yohom.foundation_fluttify.core.get

fun ContextHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.content.Context::registerReceiver" -> {
            val broadcastReceiver = rawArgs["broadcastReceiver"] as BroadcastReceiver
            val intentFilter = rawArgs["intentFilter"] as IntentFilter

            val context: Context = rawArgs.__this__()

            val intent = context.registerReceiver(broadcastReceiver, intentFilter)

            methodResult.success(intent)
        }
        else -> methodResult.notImplemented()
    }
}