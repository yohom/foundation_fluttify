package me.yohom.foundation_fluttify.android.graphics

import android.graphics.Bitmap
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import java.io.ByteArrayOutputStream

class BitmapHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    init {
        when (method) {
            // android.graphics.Bitmap data
            "android.graphics.Bitmap::getData" -> {
                val refId = args["refId"] as Int
                val bitmap = HEAP[refId] as Bitmap

                val outputStream = ByteArrayOutputStream()
                bitmap.compress(Bitmap.CompressFormat.JPEG, 100, outputStream)
                methodResult.success(outputStream.toByteArray())
            }
            // android.graphics.Bitmap recycle
            "android.graphics.Bitmap::recycle" -> {
                val refId = args["refId"] as Int
                val bitmap = HEAP[refId] as Bitmap

                bitmap.recycle()
                methodResult.success("success")
            }
            // android.graphics.Bitmap isRecycled
            "android.graphics.Bitmap::isRecycled" -> {
                val refId = args["refId"] as Int
                val bitmap = HEAP[refId] as Bitmap

                methodResult.success(bitmap.isRecycled)
            }
            else -> methodResult.notImplemented()
        }
    }
}