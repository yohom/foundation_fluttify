package me.yohom.foundation_fluttify.android.graphics

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import java.io.ByteArrayOutputStream

fun BitmapHandler(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result) {
    when (method) {
        "android.graphics.Bitmap::create" -> {
            val bitmapBytes = args["bitmapBytes"] as ByteArray
            val bitmap = BitmapFactory.decodeByteArray(bitmapBytes, 0, bitmapBytes.size)

            val hash = System.identityHashCode(bitmap)
            HEAP[hash] = bitmap

            methodResult.success(hash)
        }
        "android.graphics.Bitmap::create_batch" -> {
            val typedArgs = args as List<Map<String, ByteArray>>
            val bitmapBytesBatch = typedArgs.map { it["bitmapBytes"] as ByteArray }

            val resultBatch = bitmapBytesBatch
                    .map { BitmapFactory.decodeByteArray(it, 0, it.size) }

            resultBatch.forEach { HEAP[System.identityHashCode(it)] = it }

            methodResult.success(resultBatch)
        }
        "android.graphics.Bitmap::getData" -> {
            val refId = args["refId"] as Int
            val bitmap = HEAP[refId] as Bitmap

            val outputStream = ByteArrayOutputStream()
            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, outputStream)
            methodResult.success(outputStream.toByteArray())
        }
        "android.graphics.Bitmap::recycle" -> {
            val refId = args["refId"] as Int
            val bitmap = HEAP[refId] as Bitmap

            bitmap.recycle()
            methodResult.success("success")
        }
        "android.graphics.Bitmap::isRecycled" -> {
            val refId = args["refId"] as Int
            val bitmap = HEAP[refId] as Bitmap

            methodResult.success(bitmap.isRecycled)
        }
        else -> methodResult.notImplemented()
    }
}