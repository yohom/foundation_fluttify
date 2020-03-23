package me.yohom.foundation_fluttify.android.os

import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import me.yohom.foundation_fluttify.fluttifySequence

fun BundleHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    when (method) {
        "android.os.Bundle::create" -> {
            val seqNumber = fluttifySequence
            HEAP[seqNumber] = Bundle()
            methodResult.success(seqNumber)
        }
        else -> methodResult.notImplemented()
    }
}