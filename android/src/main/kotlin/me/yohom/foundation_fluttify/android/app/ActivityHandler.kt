package me.yohom.foundation_fluttify.android.app

import android.app.Activity
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import me.yohom.foundation_fluttify.fluttifySequence

fun ActivityHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result, context: Activity?) {
    when (method) {
        "android.app.Activity::getIntent" -> {
            val refId = args["refId"] as Int
            val targetActivity = HEAP[refId] as Activity

            val seqNumber = fluttifySequence
            HEAP[seqNumber] = targetActivity.intent

            methodResult.success(seqNumber)
        }
        "android.app.Activity::get" -> {
            val seqNumber = fluttifySequence
            HEAP[seqNumber] = context!!

            methodResult.success(seqNumber)
        }
        else -> methodResult.notImplemented()
    }
}