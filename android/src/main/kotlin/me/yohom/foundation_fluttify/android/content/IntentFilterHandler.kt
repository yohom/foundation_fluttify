package me.yohom.foundation_fluttify.android.content

import android.content.IntentFilter
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun IntentFilterHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.content.IntentFilter::create" -> {
            val args = rawArgs as Map<String, Any>

            val action = args["action"] as String

            val intentFilter = IntentFilter(action)

            HEAP[System.identityHashCode(intentFilter)] = intentFilter
            methodResult.success(System.identityHashCode(intentFilter))
        }
        else -> methodResult.notImplemented()
    }
}