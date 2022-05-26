package me.yohom.foundation_fluttify.core

import io.flutter.plugin.common.StandardMessageCodec
import me.yohom.foundation_fluttify.HEAP
import java.io.ByteArrayOutputStream
import java.lang.Exception
import java.math.BigInteger
import java.nio.ByteBuffer
import java.nio.charset.Charset
import java.util.*

@Suppress("PrivatePropertyName")
class FluttifyMessageCodec : StandardMessageCodec() {
  private val UTF8 = Charset.forName("UTF8")

  // 总体逻辑, 先尝试使用标准编解码进行处理, 如果发生异常再使用自定义的编解码处理, 再不行就只能抛异常了
  private val ARRAY: Byte = 125
  private val ENUM: Byte = 126
  private val REF: Byte = 127

  override fun writeValue(stream: ByteArrayOutputStream, value: Any) {
    try {
      super.writeValue(stream, value)
    } catch (_: IllegalArgumentException) {
      when (value) {
        is Array<*> -> {
          stream.write(ARRAY.toInt())
          writeSize(stream, value.size)
          for (o in value) {
            writeValue(stream, o!!)
          }
        }
        // 枚举值传索引
        is Enum<*> -> {
          stream.write(ENUM.toInt())
          writeInt(stream, value.ordinal)
        }
        // 其他类型传哈希值
        else -> {
          val refId = "${value.javaClass.name}:${System.identityHashCode(value)}"
          // 放入HEAP
          HEAP[refId] = value

          stream.write(REF.toInt())
          writeBytes(stream, refId.toByteArray(UTF8))
        }
      }
    }
  }

  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return try {
      super.readValueOfType(type, buffer)
    } catch (_: IllegalArgumentException) {
      when (type) {
        ARRAY -> {
          val size = readSize(buffer)
          val list: MutableList<Any> = ArrayList(size)
          var i = 0
          while (i < size) {
            list.add(readValue(buffer))
            i++
          }
          list.toTypedArray()
        }
        ENUM -> buffer.int
        REF -> {
          val bytes = readBytes(buffer)
          HEAP[String(bytes, UTF8)]
        }
        else -> throw java.lang.IllegalArgumentException("Message corrupted")
      }
    }
  }
}