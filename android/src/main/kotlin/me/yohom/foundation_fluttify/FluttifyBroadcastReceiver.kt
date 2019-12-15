package me.yohom.foundation_fluttify

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.EventChannel

class FluttifyBroadcastReceiver : BroadcastReceiver(), EventChannel.StreamHandler {
    private var events: EventChannel.EventSink? = null

    init {
        gBroadcastEventChannel.setStreamHandler(this@FluttifyBroadcastReceiver)
    }

    override fun onReceive(context: Context?, intent: Intent?) {
        intent?.run {
            HEAP[hashCode()] = this
            events?.success(hashCode())
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        this.events = events
    }

    override fun onCancel(arguments: Any?) {
        events?.endOfStream()
    }
}