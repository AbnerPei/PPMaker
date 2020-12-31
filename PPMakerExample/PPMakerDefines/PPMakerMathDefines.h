//
//  PPMakerMathDefines.h
//  PPMakerExample
//
//  Created by PPAbner on 2019/10/12.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#ifndef PPMakerMathDefines_h
#define PPMakerMathDefines_h


/// 计算两个数的差的一半，返回正值
/// @param a 第一个数
/// @param b 第二个数
CG_INLINE CGFloat halfAB(CGFloat a, CGFloat b){
    CGFloat result = (a - b) / 2;
    return ABS(result);
}


#endif /* PPMakerMathDefines_h */
