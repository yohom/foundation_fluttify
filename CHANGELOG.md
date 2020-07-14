## 0.8.11
- feat: 增加PlatformService::getAssetPath方法
- enhance: CGSize增加创建方法
- enhance: 新增FluttifyBroadcastEventChannel, 一律返回Intent

## 0.8.10
- feat: 增加UIImageView的创建
- enhance: UIView增加setAnchorPoint
- enhance: CGRect增加属性获取方法

## 0.8.9
- fix: objc application的回调不再传输NSDictionary类型的参数, 防止崩溃

## 0.8.8
- enhance: CGSize增加width和height

## 0.8.7
- enhance: 增加ImageProviderX

## 0.8.6
- enhance: 增加java_lang_Throwable

## 0.8.5
- enhance: 接口类增加sbInstance方法

## 0.8.4
- enhance: 增加android_view_SurfaceHolder_Callback

## 0.8.3
- enhance: 增加android_view_SurfaceView

## 0.8.2
- feat: android_location_Location增加setter

## 0.8.1
- feat: 增加startActivityForResult方法
- feat: 增加uri2ImageData
- feat: UIViewController::get
- feat: android_location_Location增加创建方法

## 0.8.0
- fix: UIImage scale问题处理

## 0.7.3
- feat: 增加java.io.File

## 0.7.2
- feat: 增加java_io_Closeable

## 0.7.1
- feat: Bundle增加getString和putString
- enhance: ios使用static_framework
- enhance: 适配1.17

## 0.7.0
- enhance: [breaking change] 去除CoreLocation相关逻辑, 计划分离到core_location_fluttiy插件中去
- feat: 增加android_view_View_OnTouchListener类; 增加ui_view.widget
- feat: 增加av_audio_session_category_options
- feat: CGRect增加create方法
- feat: android.graphics.Bitmap和UIImage各自增加从原生素材创建Image的方法

## 0.6.1
- enhance: android: *Handler的args参数使用Any类型, 内部再做转换
- feat: 增加批处理方法

## 0.6.0
- enhance: [breaking change] Ref类内的方法和属性都加上__后缀, 防止和子类冲突

## 0.5.1
- feat: NSError增加获取code和description的方法

## 0.5.0
- enhance: [breaking change] tag -> tag__

## 0.4.18
- feat: 增加UIViewController

## 0.4.17
- feat: 使用System.identityHashCode代替hashCode方法
- feat: 增加android.view.View.OnClickListener类
- feat: 增加startActivity/presentViewController方法

## 0.4.16
- feat: 增加NSValue类

## 0.4.15
- enhance: 简化platform方法
- enhance: 补上漏掉的log开关
- enhance: 迁移创建方法到对应类的handler里去
- feat: 增加android.app.Notification类

## 0.4.14
- enhance: CLLocationCoordinate2D增加批量创建方法

## 0.4.13
- enhance: 优化批量释放日志
- feat: UIView增加hidden和setHidden

## 0.4.12
- enhance: 优化platform方法里的释放逻辑

## 0.4.11
- enhance: Ref增加批处理释放对象方法

## 0.4.10
- feat: 增加org_json_JSONObject类

## 0.4.9
- feat: 增加android_view_View_OnApplyWindowInsetsListener类

## 0.4.8
- feat: Bitmap增加批量创建方法

## 0.4.7
- refactor: PlatformFactory统一为PlatformService
- feat: 增加ns_operation类

## 0.4.6
- feat: 增加一些通用的typedef

## 0.4.5+1
- fix: onAttachedToEngine中的Plugin对象应该使用this

## 0.4.5
- fix: PlatformFactory的activity是可选类型;
- enhance: android_util_Pair获取first和second都返回Object

## 0.4.4
- enhance: 适配新版embedding
- refactor: method channel放到objects文件里

## 0.4.3
- feat: 增加为对象动态添加属性的方法(目前仅限ios端, android理论上可以再加全局Map实现，但是目前没有碰到此类需求)

## 0.4.2
- feat: 增加java_io_Serializable

## 0.4.1
- feat: 增加android_os_Binder

## 0.4.0
- refactor: 可以放进类的静态方法替换全局函数

## 0.3.0
- refactor: 函数代替类
- chore: 提升gradle相关版本

## 0.2.7
- feat: 增加pending_intent类

## 0.2.6
- feat: android端增加BroadcastReceiver统一接收广播

## 0.2.5
- feat: CLHeading实现magneticHeading，trueHeading，headingAccuracy

## 0.2.4
- feat: android_location_Location增加bearing, altitude, accuracy, speed

## 0.2.3
- feat: 增加android_content_ContentProvider

## 0.2.2
- feat: 实现UIEdgeInsets的属性

## 0.2.1
- fix: [objc] 每个.h文件都import <Flutter/Flutter.h>

## 0.2.0
- [breaking change] 整理工厂方法

## 0.1.5
- feat: 增加cgpoint的创建支持，获取x和y

## 0.1.4
- feat: 增加android_graphics_Point的创建, getX, getY的支持

## 0.1.3
feat: 增加NSData

## 0.1.2
- 新增android.app.Activity#getIntent()
- feat: android端的Intent处理容器

## 0.1.1
- 增加android.content.Intent
