package me.yohom.foundation_fluttify.android.util

import android.util.Pair
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import me.yohom.foundation_fluttify.fluttifySequence
import me.yohom.foundation_fluttify.jsonable

fun PairHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    when (method) {
        "android.util.Pair::getFirst" -> {
            val refId = args["refId"] as Int
            val pair = HEAP[refId] as Pair<*, *>

            if (pair.first.jsonable()) {
                methodResult.success(pair.first)
            } else {
                val seqNumber = fluttifySequence
                HEAP[seqNumber] = pair.first
                methodResult.success(seqNumber)
            }
        }
        "android.util.Pair::getSecond" -> {
            val refId = args["refId"] as Int
            val pair = HEAP[refId] as Pair<*, *>

            if (pair.second.jsonable()) {
                methodResult.success(pair.second)
            } else {
                val seqNumber = fluttifySequence
                HEAP[seqNumber] = pair.second
                methodResult.success(seqNumber)
            }
        }
        else -> methodResult.notImplemented()
    }
}