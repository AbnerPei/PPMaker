//
//  PPMakerUIColorDefine.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/16.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#ifndef PPMakerUIColorDefine_h
#define PPMakerUIColorDefine_h

UIKIT_STATIC_INLINE UIColor *colorRGBA(CGFloat r,CGFloat g,CGFloat b,CGFloat a){
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];
}

UIKIT_STATIC_INLINE UIColor *colorRGB(CGFloat r,CGFloat g,CGFloat b){
    return colorRGBA(r, g, b, 1.0);
}

UIKIT_STATIC_INLINE UIColor *colorRA(CGFloat r,CGFloat a){
    return colorRGBA(r, r, r, a);
}

UIKIT_STATIC_INLINE UIColor *colorR(CGFloat r){
    return colorRA(r, 1.0);
}

UIKIT_STATIC_INLINE UIColor *colorHexStrA(NSString * _Nonnull hexStr,CGFloat a){
    //删除字符串中的空格
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6){
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]){
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:a];
}

UIKIT_STATIC_INLINE UIColor *colorHexStr(NSString * _Nonnull hexStr){
    return colorHexStrA(hexStr, 1.0);
}


/**
 * 十六进制生成color
 */
UIKIT_STATIC_INLINE UIColor *colorHexA(uint32_t hex,CGFloat a){
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0f
                           green:((float)((hex & 0xFF00) >> 8))/255.0f
                            blue:((float)(hex & 0xFF))/255.0f
                           alpha:a];
}

UIKIT_STATIC_INLINE UIColor *colorHex(uint32_t hex){
    return colorHexA(hex, 1.0);
}


UIKIT_STATIC_INLINE UIColor *randomColor(){
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return colorRGB(r, g, b);
}

//  以下2个参考：https://www.xuebuyuan.com/298520.html
/** 获取给定color的alpha */
UIKIT_STATIC_INLINE CGFloat colorGetAlpha(UIColor * _Nullable color){
    return CGColorGetAlpha(color.CGColor);
}

/* 比较两个color是否相同 */
UIKIT_STATIC_INLINE BOOL isColorEqualToColor(UIColor *color1,UIColor *color2){
    return CGColorEqualToColor(color1.CGColor, color2.CGColor);
}

#pragma mark --- 系统提供的颜色
UIKIT_STATIC_INLINE UIColor *colorWhite()      {return [UIColor whiteColor];}
UIKIT_STATIC_INLINE UIColor *colorBlack()      {return [UIColor blackColor];}
UIKIT_STATIC_INLINE UIColor *colorDarkGray()   {return [UIColor darkGrayColor];}
UIKIT_STATIC_INLINE UIColor *colorLightGray()  {return [UIColor lightGrayColor];}
UIKIT_STATIC_INLINE UIColor *colorGray()       {return [UIColor grayColor];}
UIKIT_STATIC_INLINE UIColor *colorRed()        {return [UIColor redColor];}
UIKIT_STATIC_INLINE UIColor *colorGreen()      {return [UIColor greenColor];}
UIKIT_STATIC_INLINE UIColor *colorBlue()       {return [UIColor blueColor];}
UIKIT_STATIC_INLINE UIColor *colorCyan()       {return [UIColor cyanColor];}
UIKIT_STATIC_INLINE UIColor *colorYellow()     {return [UIColor yellowColor];}
UIKIT_STATIC_INLINE UIColor *colorMagenta()    {return [UIColor magentaColor];} //品红
UIKIT_STATIC_INLINE UIColor *colorOrange()     {return [UIColor orangeColor];}
UIKIT_STATIC_INLINE UIColor *colorPurple()     {return [UIColor purpleColor];}
UIKIT_STATIC_INLINE UIColor *colorBrown()      {return [UIColor brownColor];}
UIKIT_STATIC_INLINE UIColor *colorClear()      {return [UIColor clearColor];}

UIKIT_STATIC_INLINE UIColor *color000000()     {return colorHex(0x000000);};
UIKIT_STATIC_INLINE UIColor *color333333()     {return colorHex(0x333333);};
UIKIT_STATIC_INLINE UIColor *color666666()     {return colorHex(0x666666);};
UIKIT_STATIC_INLINE UIColor *color999999()     {return colorHex(0x999999);};
UIKIT_STATIC_INLINE UIColor *colorffffff()     {return colorHex(0xffffff);};

#pragma mark --- comes from http://www.sioe.cn/yingyong/yanse-rgb-16/
/** 浅粉红 */
UIKIT_STATIC_INLINE UIColor *colorLightPink()         {return colorRGB(255, 182, 193);}
/** 天蓝色 */
UIKIT_STATIC_INLINE UIColor *colorSkyBlue()           {return colorRGB(135, 206, 235);}
/** 金黄色 */
UIKIT_STATIC_INLINE UIColor *colorGoldenYellow()      {return colorRGB(255, 215, 0);}
/** 森林绿 */
UIKIT_STATIC_INLINE UIColor *colorForestGreen()       {return colorRGB(34, 139, 34);}
/** 巧克力色 */
UIKIT_STATIC_INLINE UIColor *colorChocolate()         {return colorRGB(210, 105, 30);}
/** 印度红 */
UIKIT_STATIC_INLINE UIColor *coloRindiaRed()          {return colorRGB(176, 23, 31);}
/** 栗色 */
UIKIT_STATIC_INLINE UIColor *colorMarron()            {return colorRGB(176, 48, 96);}
/** 草莓色 */
UIKIT_STATIC_INLINE UIColor *colorStrawberry()        {return colorRGB(135, 38, 87);}
/** 番茄色 */
UIKIT_STATIC_INLINE UIColor *colorTomato()            {return colorRGB(255, 99, 71);}
/** 深红色 */
UIKIT_STATIC_INLINE UIColor *colorDeepRed()           {return colorRGB(255, 0, 255);}
/** 孔雀蓝 */
UIKIT_STATIC_INLINE UIColor *colorPeacockBlue()       {return colorRGB(51, 161, 201);}
/** 紫罗兰色 */
UIKIT_STATIC_INLINE UIColor *coloRviolet()            {return colorRGB(138, 43, 226);}
/** 黄褐色 */
UIKIT_STATIC_INLINE UIColor *colorTawny()             {return colorRGB(240, 230, 140);}
/** 淡黄色 */
UIKIT_STATIC_INLINE UIColor *colorJasmine()           {return colorRGB(245, 222, 179);}
/** 蛋壳色 */
UIKIT_STATIC_INLINE UIColor *colorEggShell()          {return colorRGB(252, 230, 201);}

#endif /* PPMakerUIColorDefine_h */
