package me.yohom.foundation_fluttify.android.app

import android.app.Activity
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import me.yohom.foundation_fluttify.__this__

fun ActivityHandler(method: String, args: Any, methodResult: MethodChannel.Result, context: Activity?) {
    when (method) {
        "android.app.Activity::getIntent" -> {
            methodResult.success(args.__this__<Activity>().intent)
        }
        "android.app.Activity::get" -> {
            methodResult.success(context)
        }
        else -> methodResult.notImplemented()
    }
}