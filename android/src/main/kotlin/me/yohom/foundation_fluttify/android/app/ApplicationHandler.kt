package me.yohom.foundation_fluttify.android.app

import android.content.Context
import io.flutter.plugin.common.MethodChannel

fun ApplicationHandler(method: String, args: Any, methodResult: MethodChannel.Result, context: Context?) {
    when (method) {
        "android.app.Application::get" -> {
            methodResult.success(context)
        }
        else -> methodResult.notImplemented()
    }
}