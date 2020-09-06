package me.yohom.foundation_fluttify.android.content

import android.content.IntentFilter
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.core.get

fun IntentFilterHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.content.IntentFilter::create" -> {
            val action = rawArgs["action"] as String

            val intentFilter = IntentFilter(action)

            methodResult.success(intentFilter)
        }
        else -> methodResult.notImplemented()
    }
}