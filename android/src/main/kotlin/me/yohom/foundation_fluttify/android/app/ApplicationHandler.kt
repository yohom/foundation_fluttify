package me.yohom.foundation_fluttify.android.app

import android.app.Activity
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun ApplicationHandler(method: String, args: Any, methodResult: MethodChannel.Result, context: Activity?) {
    when (method) {
        "android.app.Application::get" -> {
            val hash = System.identityHashCode(context?.application)
            HEAP[hash] = context?.application!!
            methodResult.success(hash)
        }
        else -> methodResult.notImplemented()
    }
}