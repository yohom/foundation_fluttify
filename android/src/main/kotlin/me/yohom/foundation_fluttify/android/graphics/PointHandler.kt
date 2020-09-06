package me.yohom.foundation_fluttify.android.graphics

import android.graphics.Point
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.core.__this__
import me.yohom.foundation_fluttify.core.get

fun PointHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "android.graphics.Point::create" -> {
            val x = rawArgs["x"] as Int
            val y = rawArgs["y"] as Int
            val point = Point(x, y)

            methodResult.success(point)
        }
        "android.graphics.Point::getX" -> {
            val point: Point = rawArgs.__this__()

            methodResult.success(point.x)
        }
        "android.graphics.Point::getY" -> {
            val point: Point = rawArgs.__this__()

            methodResult.success(point.y)
        }
        else -> methodResult.notImplemented()
    }
}