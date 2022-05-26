package me.yohom.foundation_fluttify.core;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.StandardMessageCodec;
import me.yohom.foundation_fluttify.FoundationFluttifyPluginKt;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.*;

public class FluttifyMessageCodec extends StandardMessageCodec {
  private static final Charset UTF8 = Charset.forName("UTF8");

  // 总体逻辑, 先尝试使用标准编解码进行处理, 如果发生异常再使用自定义的编解码处理, 再不行就只能抛异常了
  private static final byte ARRAY = 125;
  private static final byte ENUM = 126;
  private static final byte REF = 127;

  @Override
  protected void writeValue(@NonNull ByteArrayOutputStream stream, @NonNull Object value) {
    try {
      super.writeValue(stream, value);
    } catch (IllegalArgumentException e) {
      // 对象数组转换
      if (value instanceof Object[]) {
        stream.write(ARRAY);
        Object[] array = (Object[]) value;
        writeSize(stream, array.length);
        for (Object item : array) {
          writeValue(stream, item);
        }
      }
      // 枚举值传索引
      else if (value instanceof Enum) {
        stream.write(ENUM);
        writeInt(stream, ((Enum<?>) value).ordinal());
      } else {
        final String refId = value.getClass().getName() + ":" + System.identityHashCode(value);
        // 放入HEAP
        FoundationFluttifyPluginKt.getHEAP().put(refId, value);

        stream.write(REF);
        writeBytes(stream, refId.getBytes(UTF8));
      }
    }
  }

  @Nullable
  protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
    Object result;
    try {
      result = super.readValueOfType(type, buffer);
    } catch (IllegalArgumentException e) {
      switch (type) {
        case ARRAY:
          final int size = readSize(buffer);
          final List<Object> list = new ArrayList<>(size);
          int i = 0;
          while (i < size) {
            list.add(readValue(buffer));
            i++;
          }
          result = list.toArray();
          break;
        case ENUM:
          result = buffer.getInt();
          break;
        case REF:
          final byte[] bytes = readBytes(buffer);
          result = FoundationFluttifyPluginKt.getHEAP().get(new String(bytes, UTF8));
          break;
        default:
          result = null;
      }
    }

    return result;

  }
}