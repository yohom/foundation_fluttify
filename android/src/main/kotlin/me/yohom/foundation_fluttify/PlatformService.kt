package me.yohom.foundation_fluttify

import android.app.Activity
import android.util.Log
import io.flutter.plugin.common.MethodChannel

// TODO 跟具体类有关联的都放到对应类下面去, 不要放到PlatformService里
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
    }
}