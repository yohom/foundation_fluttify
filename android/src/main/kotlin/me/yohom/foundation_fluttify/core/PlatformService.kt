@file:Suppress("LocalVariableName", "FunctionName")

package me.yohom.foundation_fluttify.core

import android.app.Activity
import android.content.Intent
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import me.yohom.foundation_fluttify.HEAP
import me.yohom.foundation_fluttify.STACK
import me.yohom.foundation_fluttify.enableLog

fun PlatformService(
        method: String,
        args: Map<String, Any>,
        methodResult: MethodChannel.Result,
        activityBinding: ActivityPluginBinding?,
        pluginBinding: FlutterPlugin.FlutterPluginBinding?,
        registrar: PluginRegistry.Registrar?
) {
    when (method) {
        "PlatformService::enableLog" -> {
            enableLog = args["enable"] as Boolean
            methodResult.success("success")
        }
        "PlatformService::release" -> {
            if (enableLog) Log.d("PlatformService", "size: ${HEAP.size}, 释放对象: ${args["__this__"]}")

            HEAP.remove(args["__this__"])

            methodResult.success("success")

            // print current HEAP
            if (enableLog) Log.d("PlatformService", "size: ${HEAP.size}, HEAP: $HEAP")
        }
        "PlatformService::release_batch" -> {
            if (enableLog) Log.d("PlatformService", "size: ${HEAP.size}, 批量释放对象: __this_batch__: ${args["__this_batch__"]}")

            (args["__this_batch__"] as List<*>).forEach { HEAP.remove(it) }

            methodResult.success("success")

            // print current HEAP
            if (enableLog) Log.d("PlatformService", "size: ${HEAP.size}, HEAP: $HEAP")
        }
        "PlatformService::clearHeap" -> {
            if (enableLog) Log.d("PlatformService", "size: ${HEAP.size}, CLEAR HEAP")

            HEAP.clear()
            methodResult.success("success")

            // print current HEAP
            if (enableLog) Log.d("PlatformService", "size: ${HEAP.size}, HEAP: $HEAP")
        }
        "PlatformService::pushStack" -> {
            val name = args["name"] as String
            val __this__ = args["__this__"] as Any

            if (enableLog) Log.d("PlatformService", "PUSH OBJECT: $__this__")

            STACK[name] = System.identityHashCode(__this__)

            methodResult.success("success")

            // print current STACK
            if (enableLog) Log.d("PlatformService", "size: ${STACK.size}, STACK: $STACK")
        }
        "PlatformService::pushStackJsonable" -> {
            val name = args["name"] as String
            val data = args["data"]

            if (enableLog) Log.d("PlatformService", "压入jsonable: ${data?.javaClass}@${data}")

            STACK[name] = data!!

            methodResult.success("success")

            // 打印当前STACK
            if (enableLog) Log.d("PlatformService", "size: ${STACK.size}, STACK: $STACK")
        }
        "PlatformService::clearStack" -> {
            STACK.clear()

            methodResult.success("success")

            // print current STACK
            if (enableLog) Log.d("PlatformService", "size: ${STACK.size}, STACK: $STACK")

        }
        "PlatformService::startActivity" -> {
            val activity = activityBinding?.activity

            if (activity != null) {
                val activityClass = args["activityClass"] as String
                val extras = args["extras"] as Map<String, Any>

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

                methodResult.success("success")
            } else {
                methodResult.error("当前Activity为null", "当前Activity为null", "当前Activity为null")
            }
        }
        "PlatformService::startActivityForResult" -> {
            val activity = activityBinding?.activity

            if (activity != null) {
                val activityClass = args["activityClass"] as String
                val requestCode = args["requestCode"] as Int
                val extras = args["extras"] as Map<String, Any>

                val intent = Intent(activity, Class.forName(activityClass))
                extras.forEach {
                    when (it.value) {
                        is String -> intent.putExtra(it.key, it.value as String)
                        is Int -> intent.putExtra(it.key, it.value as Int)
                        is Long -> intent.putExtra(it.key, it.value as Long)
                        is Double -> intent.putExtra(it.key, it.value as Double)
                    }
                }
                activity.startActivityForResult(intent, requestCode)
                activityBinding.addActivityResultListener { reqCode, resultCode, data ->
                    if (reqCode == requestCode) {
                        if (resultCode == Activity.RESULT_OK) {
                            methodResult.success(data)
                        } else {
                            methodResult.error("获取Activity结果失败", "获取Activity结果失败", "获取Activity结果失败")
                        }
                    } else {
                        methodResult.error("非当前请求的响应", "非当前请求的响应", "非当前请求的响应")
                    }
                    true
                }

                methodResult.success("success")
            } else {
                methodResult.error("当前Activity为null", "当前Activity为null", "当前Activity为null")
            }
        }
        "PlatformService::getAssetPath" -> {
            val activity = activityBinding?.activity

            val flutterAssetPath = args["flutterAssetPath"] as String

            if (activity != null) {
                val path = registrar?.lookupKeyForAsset(flutterAssetPath)
                        ?: pluginBinding?.flutterAssets?.getAssetFilePathByName(flutterAssetPath)
                methodResult.success(path)
            } else {
                methodResult.error("非当前请求的响应", "非当前请求的响应", "非当前请求的响应")
            }
        }
        else -> methodResult.notImplemented()
    }
}