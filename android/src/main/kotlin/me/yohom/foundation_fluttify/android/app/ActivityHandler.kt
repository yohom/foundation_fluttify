package me.yohom.foundation_fluttify.android.app

import android.app.Activity
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun ActivityHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result, context: Activity?) {
    when (method) {
        "android.app.Activity::getIntent" -> {
            val refId = args["refId"] as Int
            val targetActivity = HEAP[refId] as Activity
            methodResult.success(targetActivity.intent.apply { HEAP[hashCode()] = this }.hashCode())
        }
        "android.app.Activity::get" -> {
            methodResult.success(context?.apply { HEAP[hashCode()] = this }?.hashCode())
        }
        else -> methodResult.notImplemented()
    }
}