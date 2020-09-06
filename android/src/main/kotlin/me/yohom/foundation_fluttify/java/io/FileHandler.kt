package me.yohom.foundation_fluttify.java.io

import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.core.get
import java.io.File

fun FileHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "java.io.File::create" -> {
            val path = rawArgs["path"] as String
            val file = File(path)

            methodResult.success(file)
        }
        else -> methodResult.notImplemented()
    }
}