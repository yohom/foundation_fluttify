package me.yohom.foundation_fluttify.android.graphics

import android.graphics.Point
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP

fun PointHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.graphics.Point::create" -> {
            val args = rawArgs as Map<String, Any>

            val x = args["x"] as Int
            val y = args["y"] as Int
            val point = Point(x, y)

            val hash = System.identityHashCode(point)
            HEAP[hash] = point

            methodResult.success(hash)
        }
        "android.graphics.Point::getX" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val point = HEAP[refId] as Point

            methodResult.success(point.x)
        }
        "android.graphics.Point::getY" -> {
            val args = rawArgs as Map<String, Any>

            val refId = args["refId"] as Int
            val point = HEAP[refId] as Point

            methodResult.success(point.y)
        }
        else -> methodResult.notImplemented()
    }
}