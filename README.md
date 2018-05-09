
# iOS链式创建UI终结者 ➜ PPMaker


---

> 做iOS开发，创建UI控件，必须的不说，还多，尤其你新入手一个项目。
> 
> 我自己写代码，向来想省事：**怎么能不一个一个属性写？**带着这个问题，我刚**开始创建了各种Tool**来处理，**后来用Category**（[证据在此](https://github.com/chinesemanbobo/PPDemo/blob/master/PPDemos/AllMds/EasilyCreatYYLabel.md)），可Category有个烦人的问题：**有些属性我不需要但是方法参数有，而有些属性我需要方法参数没有**。
>
> 昨天，看到**臧成威**的[如何利用Objective-C写一个精美的DSL](http://williamzang.com/blog/2017/01/10/ru-he-jing-mei-de-xie-yi-ge-lian-shi-ocku/),唉，挺好，就想着优化下自己的，于是就有了 **[PPMaker](https://github.com/chinesemanbobo/PPMaker)**.
> > 在此，献上对臧老师的感谢。

## PPMaker的不同（优点）
➊ 链式调用，代码简洁；

![特别字符统一处理](https://upload-images.jianshu.io/upload_images/402808-24ebbf296ff45393.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

➋ 点语法后面有提示`（Masonry是没有的 ）`；

![PPMaker有提示](https://upload-images.jianshu.io/upload_images/402808-b32a026ef1dc7db4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Masonry没提示](https://upload-images.jianshu.io/upload_images/402808-e65447b2fdab259f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

➌ 不需要终结词 `臧老师给的示例有`；
➍ 不需要助词 `如Masonry中的with`，这个也可以说是一个缺点吧；
➎ pod可根据需求随意选择。

![模块可独立使用](https://upload-images.jianshu.io/upload_images/402808-5398c9734df990dc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
➏ 不需要的属性，根本不用管 `主要对比Category`;

## PPMaker的用法
### 第一步、导入PPMaker
#### 方法一、使用CocoaPods安装
> pod 'PPMaker', '~> 0.0.22'
#### 方法二、手动下载拖入 

### 第二步、用对应的类`如:UILable`直接调用`pp_`
![easyToUse_lb](https://upload-images.jianshu.io/upload_images/402808-65cd51a65e511490.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![easyToUse_imgV](https://upload-images.jianshu.io/upload_images/402808-cfe138d8d35ee69e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如下创建一个简单的UILabel对象：
![Snip20180509_10.png](https://upload-images.jianshu.io/upload_images/402808-5830f4ff08b5c8ac.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> maker调用，直接调UILabel对象的属性，如`text`、`textColor`、`frame`等，当然也有自定义的，如`intoView`表示要加到哪个view上、`fontSize`实际上`[UIFont systemFontOfSize:fontSize]`的简化等等。
> 
> **总之，PPMaker is very easy to use.**

## 创建UI控件的路程

### 起初：一个属性一个属性赋值
```
UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 300, 50)];
[self.view addSubview:lb];
lb.backgroundColor = [UIColor whiteColor];
lb.text = @"我是一个lb";
lb.textColor = [UIColor blueColor];
lb.textAlignment = NSTextAlignmentCenter;
lb.font = [UIFont systemFontOfSize:18];
```
### 后来：用Category快速创建
```
@interface UILabel (EasyMake)
+(UILabel *)lbMakeWithSuperV:(UIView *)superV
frame:(CGRect)frame
font:(UIFont *)font
alignment:(NSTextAlignment)alignment
text:(NSString *)text
textColor:(UIColor *)textColor;

@implementation UILabel (EasyMake)
+(UILabel *)lbMakeWithSuperV:(UIView *)superV
frame:(CGRect)frame
font:(UIFont *)font
alignment:(NSTextAlignment)alignment
text:(NSString *)text
textColor:(UIColor *)textColor
{
UILabel *lb = [[UILabel alloc]init];
if (superV) {
[superV addSubview:lb];
}
if (font) {
lb.font = font;
}
if (text) {
lb.text = text;
}
if (textColor) {
lb.textColor = textColor;
}
lb.frame = frame;
lb.textAlignment = alignment;
return lb;
}
@end
```
### 现在：链式调用的 DSL

![Snip20180509_11.png](https://upload-images.jianshu.io/upload_images/402808-5f262657ca0dda59.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20180509_13.png](https://upload-images.jianshu.io/upload_images/402808-5df3363a9599e69f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20180509_14.png](https://upload-images.jianshu.io/upload_images/402808-56cfcd61b34cadf8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20180509_15.png](https://upload-images.jianshu.io/upload_images/402808-79dc24f307b35c19.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 结语
**[PPMaker](https://github.com/chinesemanbobo/PPMaker)**是自己写的最满意的一个库，解决了自己一直以来**创建UI**、**配置attributedText**的苦恼，这其中也参考了一些大神的的blog和开源库，在此，再次表示感谢。今天，分享自己的这个库，希望帮助像我一样的同学，其次，希望觉得好的，给个star.

当然了，这个库，我会持续更新的，有什么问题，欢迎提出来。或者**谁有更好的做法，热烈欢迎告知一下，深表谢意！**








