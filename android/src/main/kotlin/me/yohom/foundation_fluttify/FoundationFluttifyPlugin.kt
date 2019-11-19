package me.yohom.foundation_fluttify

import android.os.Bundle
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

// The stack that exists on the Dart side for a method call is enabled only when the MethodChannel passing parameters are limited
val STACK = mutableMapOf<String, Any>()
// Container for Dart side random access objects
val HEAP = mutableMapOf<Int, Any>()
// whether enable log or not
var enableLog: Boolean = true

class FoundationFluttifyPlugin(private val registrar: Registrar) : MethodCallHandler {
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
            // toggle log
            "PlatformService::enableLog" -> {
                enableLog = args["enable"] as Boolean
                methodResult.success("success")
            }
            // get Application obejct
            "PlatformFactory::getandroid_app_Application" -> {
                methodResult.success(registrar.activity().application.apply { HEAP[hashCode()] = this }.hashCode())
            }
            // get FlutterActivity object
            "PlatformFactory::getandroid_app_Activity" -> {
                methodResult.success(registrar.activity().apply { HEAP[hashCode()] = this }.hashCode())
            }
            // create android.os.Bundle
            "PlatformFactory::createandroid_os_Bundle" -> {
                methodResult.success(Bundle().apply { HEAP[hashCode()] = this }.hashCode())
            }
            // create bitmap object
            "PlatformFactory::createandroid_graphics_Bitmap" -> {
                val bitmapBytes = args["bitmapBytes"] as ByteArray
                val bitmap = android.graphics.BitmapFactory.decodeByteArray(bitmapBytes, 0, bitmapBytes.size)

                HEAP[bitmap.hashCode()] = bitmap

                methodResult.success(bitmap.hashCode())
            }
            // release an object
            "PlatformFactory::release" -> {
                if (enableLog)
                    Log.d("PlatformFactory", "释放对象: ${HEAP[args["refId"] as Int]?.javaClass}@${args["refId"]}")

                HEAP.remove(args["refId"] as Int)

                methodResult.success("success")

                // print current HEAP
                if (enableLog) Log.d("PlatformFactory", "HEAP: $HEAP")
            }
            // clear objects in HEAP
            "PlatformFactory::clearHeap" -> {
                if (enableLog)
                    Log.d("PlatformFactory", "CLEAR HEAP")

                HEAP.clear()
                methodResult.success("success")

                // print current HEAP
                if (enableLog)
                    Log.d("PlatformFactory", "HEAP: $HEAP")
            }
            // push an object to stack
            "PlatformFactory::pushStack" -> {
                val name = args["name"] as String
                val refId = args["refId"] as Int

                Log.d("PlatformFactory", "PUSH OBJECT: ${HEAP[refId]?.javaClass}@${refId}")

                HEAP[refId]?.run { STACK[name] = this }

                methodResult.success("success")

                // print current STACK
                if (enableLog) Log.d("PlatformFactory", "STACK: $STACK")
            }
            // push a jsonable to stack
            "PlatformFactory::pushStackJsonable" -> {
                val name = args["name"] as String
                val data = args["data"]

                Log.d("PlatformFactory", "压入jsonable: ${data?.javaClass}@${data}")

                STACK[name] = data!!

                methodResult.success("success")

                // 打印当前STACK
                if (enableLog) Log.d("PlatformFactory", "STACK: $STACK")
            }
            // clear STACK
            "PlatformFactory::clearStack" -> {
                STACK.clear()

                methodResult.success("success")

                // print current STACK
                if (enableLog) Log.d("PlatformFactory", "STACK: $STACK")
            }
            // android.location.Location latitude
            "android.location.Location::getLatitude" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as android.location.Location

                methodResult.success(location.latitude)
            }
            // android.location.Location longitude
            "android.location.Location::getLongitude" -> {
                val refId = args["refId"] as Int
                val location = HEAP[refId] as android.location.Location

                methodResult.success(location.longitude)
            }
            else -> methodResult.notImplemented()
        }
    }
}
