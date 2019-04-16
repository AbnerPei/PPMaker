//
//  PPMakerColorDefine.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/4/16.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#ifndef PPMakerColorDefine_h
#define PPMakerColorDefine_h

NS_ASSUME_NONNULL_BEGIN

CG_INLINE UIColor *rgba(CGFloat r,CGFloat g,CGFloat b,CGFloat a){
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];
}

CG_INLINE UIColor *rgb(CGFloat r,CGFloat g,CGFloat b){
    return rgba(r, g, b, 1.0);
}

CG_INLINE UIColor *ra(CGFloat r,CGFloat a){
    return rgba(r, r, r, a);
}

CG_INLINE UIColor *r(CGFloat r){
    return ra(r, 1.0);
}

CG_INLINE UIColor *hexa(NSString * _Nonnull hexStr,CGFloat a){
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

CG_INLINE UIColor *hex(NSString * _Nonnull hexStr){
    return hexa(hexStr, 1.0);
}

CG_INLINE UIColor *randomColor(){
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return rgb(r, g, b);
}

#pragma mark --- 系统提供的颜色
CG_INLINE UIColor *white()      {return [UIColor whiteColor];}
CG_INLINE UIColor *black()      {return [UIColor blackColor];}
CG_INLINE UIColor *darkGray()   {return [UIColor darkGrayColor];}
CG_INLINE UIColor *lightGray()  {return [UIColor lightGrayColor];}
CG_INLINE UIColor *gray()       {return [UIColor grayColor];}
CG_INLINE UIColor *red()        {return [UIColor redColor];}
CG_INLINE UIColor *green()      {return [UIColor greenColor];}
CG_INLINE UIColor *blue()       {return [UIColor blueColor];}
CG_INLINE UIColor *cyan()       {return [UIColor cyanColor];}
CG_INLINE UIColor *yellow()     {return [UIColor yellowColor];}
CG_INLINE UIColor *magenta()    {return [UIColor magentaColor];} //品红
CG_INLINE UIColor *orange()     {return [UIColor orangeColor];}
CG_INLINE UIColor *purple()     {return [UIColor purpleColor];}
CG_INLINE UIColor *brown()      {return [UIColor brownColor];}
CG_INLINE UIColor *clear()      {return [UIColor clearColor];}

#pragma mark --- comes from http://www.sioe.cn/yingyong/yanse-rgb-16/
/** 浅粉红 */
CG_INLINE UIColor *c_lightPink()         {return rgb(255, 182, 193);}
/** 天蓝色 */
CG_INLINE UIColor *c_skyBlue()           {return rgb(135, 206, 235);}
/** 金黄色 */
CG_INLINE UIColor *c_goldenYellow()      {return rgb(255, 215, 0);}
/** 森林绿 */
CG_INLINE UIColor *c_forestGreen()       {return rgb(34, 139, 34);}
/** 巧克力色 */
CG_INLINE UIColor *c_chocolate()         {return rgb(210, 105, 30);}
/** 印度红 */
CG_INLINE UIColor *c_indiaRed()          {return rgb(176, 23, 31);}
/** 栗色 */
CG_INLINE UIColor *c_marron()            {return rgb(176, 48, 96);}
/** 草莓色 */
CG_INLINE UIColor *c_strawberry()        {return rgb(135, 38, 87);}
/** 番茄色 */
CG_INLINE UIColor *c_tomato()            {return rgb(255, 99, 71);}
/** 深红色 */
CG_INLINE UIColor *c_deepRed()           {return rgb(255, 0, 255);}
/** 孔雀蓝 */
CG_INLINE UIColor *c_peacockBlue()       {return rgb(51, 161, 201);}
/** 紫罗兰色 */
CG_INLINE UIColor *c_violet()            {return rgb(138, 43, 226);}
/** 黄褐色 */
CG_INLINE UIColor *c_tawny()             {return rgb(240, 230, 140);}
/** 淡黄色 */
CG_INLINE UIColor *c_jasmine()           {return rgb(245, 222, 179);}
/** 蛋壳色 */
CG_INLINE UIColor *c_eggShell()          {return rgb(252, 230, 201);}

NS_ASSUME_NONNULL_END

#endif /* PPMakerColorDefine_h */
