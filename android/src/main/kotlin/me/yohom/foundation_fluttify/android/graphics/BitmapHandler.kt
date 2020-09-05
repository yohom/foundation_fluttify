package me.yohom.foundation_fluttify.android.graphics

import android.app.Activity
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import io.flutter.plugin.common.MethodChannel
import me.yohom.foundation_fluttify.HEAP
import me.yohom.foundation_fluttify.__this__
import me.yohom.foundation_fluttify.get
import java.io.ByteArrayOutputStream

fun BitmapHandler(method: String, rawArgs: Any, methodResult: MethodChannel.Result, activity: Activity?) {
    when (method) {
        "android.graphics.Bitmap::create" -> {
            val bitmapBytes = rawArgs["bitmapBytes"] as ByteArray
            val bitmap = BitmapFactory.decodeByteArray(bitmapBytes, 0, bitmapBytes.size)

            methodResult.success(bitmap)
        }
        "android.graphics.Bitmap::createWithDrawable" -> {
            val drawableId = rawArgs["drawableId"] as Int
            if (activity != null) {
                val bitmap = BitmapFactory.decodeResource(activity.resources, drawableId)
                methodResult.success(bitmap)
            } else {
                methodResult.error("Activity不能为null", "Activity不能为null", "Activity不能为null")
            }
        }
        "android.graphics.Bitmap::create_batch" -> {
            val typedArgs = rawArgs as List<Map<String, ByteArray>>
            val bitmapBytesBatch = typedArgs.map { it["bitmapBytes"] as ByteArray }

            val resultBatch = bitmapBytesBatch
                    .map { BitmapFactory.decodeByteArray(it, 0, it.size) }

            methodResult.success(resultBatch)
        }
        "android.graphics.Bitmap::getData" -> {
            val bitmap = rawArgs["__this__"] as Bitmap

            val outputStream = ByteArrayOutputStream()
            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, outputStream)
            methodResult.success(outputStream.toByteArray())
        }
        "android.graphics.Bitmap::recycle" -> {
            val bitmap: Bitmap = rawArgs.__this__()

            bitmap.recycle()
            methodResult.success("success")
        }
        "android.graphics.Bitmap::isRecycled" -> {
            val bitmap: Bitmap = rawArgs.__this__()

            methodResult.success(bitmap.isRecycled)
        }
        else -> methodResult.notImplemented()
    }
}