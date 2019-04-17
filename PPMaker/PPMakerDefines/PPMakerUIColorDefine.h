//
//  PPMakerUIColorDefine.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/16.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#ifndef PPMakerUIColorDefine_h
#define PPMakerUIColorDefine_h

NS_ASSUME_NONNULL_BEGIN

CG_INLINE UIColor *colorRGBA(CGFloat r,CGFloat g,CGFloat b,CGFloat a){
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];
}

CG_INLINE UIColor *colorRGB(CGFloat r,CGFloat g,CGFloat b){
    return colorRGBA(r, g, b, 1.0);
}

CG_INLINE UIColor *colorRA(CGFloat r,CGFloat a){
    return colorRGBA(r, r, r, a);
}

CG_INLINE UIColor *colorR(CGFloat r){
    return colorRA(r, 1.0);
}

CG_INLINE UIColor *colorHexA(NSString * _Nonnull hexStr,CGFloat a){
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

CG_INLINE UIColor *colorHex(NSString * _Nonnull hexStr){
    return colorHexA(hexStr, 1.0);
}

CG_INLINE UIColor *randomColor(){
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return colorRGB(r, g, b);
}

//  以下2个参考：https://www.xuebuyuan.com/298520.html
/** 获取给定color的alpha */
CG_INLINE CGFloat colorGetAlpha(UIColor * _Nullable color){
    return CGColorGetAlpha(color.CGColor);
}

/* 比较两个color是否相同 */
CG_INLINE BOOL isColorEqualToColor(UIColor *color1,UIColor *color2){
    return CGColorEqualToColor(color1.CGColor, color2.CGColor);
}

#pragma mark --- 系统提供的颜色
CG_INLINE UIColor *colorWhite()      {return [UIColor whiteColor];}
CG_INLINE UIColor *colorBlack()      {return [UIColor blackColor];}
CG_INLINE UIColor *colorDarkGray()   {return [UIColor darkGrayColor];}
CG_INLINE UIColor *colorLightGray()  {return [UIColor lightGrayColor];}
CG_INLINE UIColor *colorGray()       {return [UIColor grayColor];}
CG_INLINE UIColor *colorRed()        {return [UIColor redColor];}
CG_INLINE UIColor *colorGreen()      {return [UIColor greenColor];}
CG_INLINE UIColor *colorBlue()       {return [UIColor blueColor];}
CG_INLINE UIColor *colorCyan()       {return [UIColor cyanColor];}
CG_INLINE UIColor *colorYellow()     {return [UIColor yellowColor];}
CG_INLINE UIColor *colorMagenta()    {return [UIColor magentaColor];} //品红
CG_INLINE UIColor *colorOrange()     {return [UIColor orangeColor];}
CG_INLINE UIColor *colorPurple()     {return [UIColor purpleColor];}
CG_INLINE UIColor *colorBrown()      {return [UIColor brownColor];}
CG_INLINE UIColor *colorClear()      {return [UIColor clearColor];}

CG_INLINE UIColor *color000000()     {return colorHex(@"0x000000");};
CG_INLINE UIColor *color333333()     {return colorHex(@"0x333333");};
CG_INLINE UIColor *color666666()     {return colorHex(@"0x666666");};
CG_INLINE UIColor *color999999()     {return colorHex(@"0x999999");};
CG_INLINE UIColor *colorffffff()     {return colorHex(@"0xffffff");};

#pragma mark --- comes from http://www.sioe.cn/yingyong/yanse-rgb-16/
/** 浅粉红 */
CG_INLINE UIColor *colorLightPink()         {return colorRGB(255, 182, 193);}
/** 天蓝色 */
CG_INLINE UIColor *colorSkyBlue()           {return colorRGB(135, 206, 235);}
/** 金黄色 */
CG_INLINE UIColor *colorGoldenYellow()      {return colorRGB(255, 215, 0);}
/** 森林绿 */
CG_INLINE UIColor *colorForestGreen()       {return colorRGB(34, 139, 34);}
/** 巧克力色 */
CG_INLINE UIColor *colorChocolate()         {return colorRGB(210, 105, 30);}
/** 印度红 */
CG_INLINE UIColor *coloRindiaRed()          {return colorRGB(176, 23, 31);}
/** 栗色 */
CG_INLINE UIColor *colorMarron()            {return colorRGB(176, 48, 96);}
/** 草莓色 */
CG_INLINE UIColor *colorStrawberry()        {return colorRGB(135, 38, 87);}
/** 番茄色 */
CG_INLINE UIColor *colorTomato()            {return colorRGB(255, 99, 71);}
/** 深红色 */
CG_INLINE UIColor *colorDeepRed()           {return colorRGB(255, 0, 255);}
/** 孔雀蓝 */
CG_INLINE UIColor *colorPeacockBlue()       {return colorRGB(51, 161, 201);}
/** 紫罗兰色 */
CG_INLINE UIColor *coloRviolet()            {return colorRGB(138, 43, 226);}
/** 黄褐色 */
CG_INLINE UIColor *colorTawny()             {return colorRGB(240, 230, 140);}
/** 淡黄色 */
CG_INLINE UIColor *colorJasmine()           {return colorRGB(245, 222, 179);}
/** 蛋壳色 */
CG_INLINE UIColor *colorEggShell()          {return colorRGB(252, 230, 201);}

NS_ASSUME_NONNULL_END

#endif /* PPMakerUIColorDefine_h */
