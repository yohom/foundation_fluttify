package me.yohom.foundation_fluttify.java.io

import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import java.io.File

fun FileHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result) {
    when (method) {
        "java.io.File::create" -> {
            val args = rawArgs as Map<String, Any>

            val path = args["path"] as String
            val file = File(path)

            val hash = System.identityHashCode(file)
            HEAP[hash] = file

            methodResult.success(hash)
        }
        else -> methodResult.notImplemented()
    }
}