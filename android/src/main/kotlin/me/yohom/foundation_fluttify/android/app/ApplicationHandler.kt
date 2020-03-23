package me.yohom.foundation_fluttify.android.app

import android.app.Activity
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import me.yohom.foundation_fluttify.fluttifySequence

fun ApplicationHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result, context: Activity?) {
    when (method) {
        "android.app.Application::get" -> {
            val seqNumber = fluttifySequence
            HEAP[seqNumber] = context?.application!!

            methodResult.success(seqNumber)
        }
        else -> methodResult.notImplemented()
    }
}