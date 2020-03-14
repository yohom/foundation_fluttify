package me.yohom.foundation_fluttify.android.app

import android.app.Activity
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun ApplicationHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result, context: Activity?) {
    when (method) {
        "android.app.Application::get" -> {
            methodResult.success(context?.application?.apply { HEAP[hashCode()] = this }?.hashCode())
        }
        else -> methodResult.notImplemented()
    }
}