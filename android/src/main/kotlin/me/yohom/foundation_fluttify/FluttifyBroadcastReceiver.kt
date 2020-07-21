package me.yohom.foundation_fluttify

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import io.flutter.plugin.common.EventChannel

class FluttifyBroadcastReceiver : BroadcastReceiver(), EventChannel.StreamHandler {
    private var eventSink: EventChannel.EventSink? = null

    override fun onReceive(context: Context?, intent: Intent?) {
        println("收到广播: $intent")
        intent?.run {
            val hash = System.identityHashCode(this)
            HEAP[hash] = this
            eventSink?.success(hash)
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        println("FluttifyBroadcastReceiver: $arguments")
        this.eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink?.endOfStream()
    }
}