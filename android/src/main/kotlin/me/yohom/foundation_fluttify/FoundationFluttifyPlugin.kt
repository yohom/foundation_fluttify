package me.yohom.foundation_fluttify

import android.os.Bundle
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

// Container for Dart side random access objects
val HEAP_Platform = mutableMapOf<Int, Any>()

class FoundationFluttifyPlugin(private val registrar: Registrar): MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "com.fluttify/foundation")
      channel.setMethodCallHandler(FoundationFluttifyPlugin(registrar))
    }
  }

  override fun onMethodCall(methodCall: MethodCall, methodResult: Result) {
    val args = methodCall.arguments as? Map<String, Any> ?: mapOf()
    when (methodCall.method) {
      // get Application obejct
      "PlatformFactory::getandroid_app_Application" -> {
        methodResult.success(registrar.activity().application.apply { HEAP_Platform[hashCode()] = this }.hashCode())
      }
      // get FlutterActivity object
      "PlatformFactory::getandroid_app_Activity" -> {
        methodResult.success(registrar.activity().apply { HEAP_Platform[hashCode()] = this }.hashCode())
      }
      // create android.os.Bundle
      "PlatformFactory::createandroid_os_Bundle" -> {
        methodResult.success(Bundle().apply { HEAP_Platform[hashCode()] = this }.hashCode())
      }
      // create bitmap object
      "PlatformFactory::createandroid_graphics_Bitmap" -> {
        val bitmapBytes = args["bitmapBytes"] as ByteArray
        val bitmap = android.graphics.BitmapFactory.decodeByteArray(bitmapBytes, 0, bitmapBytes.size)

        HEAP_Platform[bitmap.hashCode()] = bitmap

        methodResult.success(bitmap.hashCode())
      }
      // release an object
      "PlatformFactory::release" -> {
        Log.d("PlatformFactory", "释放对象: ${HEAP_Platform[args["refId"] as Int]?.javaClass}@${args["refId"]}")

        HEAP_Platform.remove(args["refId"] as Int)

        methodResult.success("success")

        // print current HEAP_Platform
        Log.d("PlatformFactory", "HEAP_Platform: $HEAP_Platform")
      }
      // clear objects in HEAP_Platform
      "PlatformFactory::clearHeap" -> {
        Log.d("PlatformFactory", "CLEAR HEAP")

        HEAP_Platform.clear()
        methodResult.success("success")

        // print current HEAP_Platform
        Log.d("PlatformFactory", "HEAP_Platform: $HEAP_Platform")
      }
      else -> methodResult.notImplemented()
    }
  }
}
