package me.yohom.foundation_fluttify

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import io.flutter.plugin.common.MethodChannel

fun PlatformService(method: String, args: Map<String, Any>, methodResult: MethodChannel.Result, activity: Activity?) {
    when (method) {
        "PlatformService::enableLog" -> {
            enableLog = args["enable"] as Boolean
            methodResult.success("success")
        }
        "PlatformService::release" -> {
            if (enableLog) {
                Log.d("PlatformService", "释放对象: ${HEAP[args["refId"] as Int]?.javaClass}@${args["refId"]}")
            }

            HEAP.remove(args["refId"] as Int)

            methodResult.success("success")

            // print current HEAP
            if (enableLog) {
                Log.d("PlatformService", "HEAP: $HEAP")
            }
        }
        "PlatformService::release_batch" -> {
            if (enableLog) {
                Log.d("PlatformService", "批量释放对象: refId_batch: ${(args["refId_batch"] as List<Int>)}")
            }

            (args["refId_batch"] as List<Int>).forEach { HEAP.remove(it) }

            methodResult.success("success")

            // print current HEAP
            if (enableLog) {
                Log.d("PlatformService", "HEAP: $HEAP")
            }
        }
        "PlatformService::clearHeap" -> {
            if (enableLog)
                Log.d("PlatformService", "CLEAR HEAP")

            HEAP.clear()
            methodResult.success("success")

            // print current HEAP
            if (enableLog) {
                Log.d("PlatformService", "HEAP: $HEAP")
            }
        }
        "PlatformService::pushStack" -> {
            val name = args["name"] as String
            val refId = args["refId"] as Int

            if (enableLog) {
                Log.d("PlatformService", "PUSH OBJECT: ${HEAP[refId]?.javaClass}@${refId}")
            }

            HEAP[refId]?.run { STACK[name] = this }

            methodResult.success("success")

            // print current STACK
            if (enableLog) {
                Log.d("PlatformService", "STACK: $STACK")
            }
        }
        "PlatformService::pushStackJsonable" -> {
            val name = args["name"] as String
            val data = args["data"]

            if (enableLog) {
                Log.d("PlatformService", "压入jsonable: ${data?.javaClass}@${data}")
            }

            STACK[name] = data!!

            methodResult.success("success")

            // 打印当前STACK
            if (enableLog) {
                Log.d("PlatformService", "STACK: $STACK")
            }
        }
        "PlatformService::clearStack" -> {
            STACK.clear()

            methodResult.success("success")

            // print current STACK
            if (enableLog) {
                Log.d("PlatformService", "STACK: $STACK")
            }
        }
        "PlatformService::startActivity" -> {
            val activityClass = args["activityClass"] as String
            val extras = args["extras"] as Map<String, Any>

            if (activity != null) {
                val intent = Intent(activity, Class.forName(activityClass))
                extras.forEach {
                    when (it.value) {
                        is String -> intent.putExtra(it.key, it.value as String)
                        is Int -> intent.putExtra(it.key, it.value as Int)
                        is Long -> intent.putExtra(it.key, it.value as Long)
                        is Double -> intent.putExtra(it.key, it.value as Double)
                    }
                }
                activity.startActivity(intent)
            } else {
                if (enableLog) {
                    Log.w("PlatformService", "当前Activity为null!")
                }
            }

            methodResult.success("success")
        }
    }
}