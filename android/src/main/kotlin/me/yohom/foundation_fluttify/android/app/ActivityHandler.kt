package me.yohom.foundation_fluttify.android.app

import android.app.Activity
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

class ActivityHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    init {
        when (method) {
            // android.app.Activity#getIntent
            "android.app.Activity::getIntent" -> {
                val refId = args["refId"] as Int
                val activity = HEAP[refId] as Activity
                methodResult.success(activity.intent.apply { HEAP[hashCode()] = this }.hashCode())
            }
        }
    }
}