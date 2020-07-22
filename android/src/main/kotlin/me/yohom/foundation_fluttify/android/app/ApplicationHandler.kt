package me.yohom.foundation_fluttify.android.app

import android.app.Activity
import android.content.Context
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun ApplicationHandler(method: String, args: Any, methodResult: MethodChannel.Result, context: Context?) {
    when (method) {
        "android.app.Application::get" -> {
            val hash = System.identityHashCode(context)
            HEAP[hash] = context!!
            methodResult.success(hash)
        }
        else -> methodResult.notImplemented()
    }
}