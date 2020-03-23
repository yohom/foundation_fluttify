package me.yohom.foundation_fluttify.android.app

import android.app.Activity
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun ActivityHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result, context: Activity?) {
    when (method) {
        "android.app.Activity::getIntent" -> {
            val refId = args["refId"] as Int
            val targetActivity = HEAP[refId] as Activity

            val hash = System.identityHashCode(targetActivity.intent)
            HEAP[hash] = targetActivity.intent
            methodResult.success(hash)
        }
        "android.app.Activity::get" -> {
            val hash = System.identityHashCode(context)
            HEAP[hash] = context!!
            methodResult.success(hash)
        }
        else -> methodResult.notImplemented()
    }
}