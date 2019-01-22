//
//  PPMakeAlgorithm_StringInvert_ViewController.m
//  PPMakerExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/9/3.
//  Copyright © 2018年 PPAbner. All rights reserved.
//
// 待做 ：https://blog.csdn.net/qq_34047841/article/details/65936058

#import "PPMakeAlgorithm_StringInvert_ViewController.h"
typedef NS_ENUM(NSInteger,PPMakeStringInvertStyle) {
    PPMakeStringInvertStyleLetterByLetter = 0,   //以单个字母为单位反转
    PPMakeStringInvertStyleWordByWord            //以单词为单位反转
};

@interface PPMakeAlgorithm_StringInvert_ViewController ()

@end

@implementation PPMakeAlgorithm_StringInvert_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *str1 = @"Hello World!";
    
    NSString *invertedStr =  [self ppmake_invertString:str1 invertStyle:(PPMakeStringInvertStyleLetterByLetter)];
    NSLog(@"反转后的字符串 %@",invertedStr);
    //反转后的字符串 !dlroW olleH
    

    stringReverse([str1 cStringUsingEncoding:NSASCIIStringEncoding]);

}

-(NSString *)ppmake_invertString:(NSString *)str invertStyle:(PPMakeStringInvertStyle)invertStyle
{
    //以单个字母为单位
    switch (invertStyle) {
        case PPMakeStringInvertStyleLetterByLetter:
        {
            NSMutableString *mutStr = [[NSMutableString alloc] init];
            for (int i = 0; i < str.length; i++) {
                NSRange range = NSMakeRange(str.length-1-i, 1);
                [mutStr appendString:[str substringWithRange:range]];
            }
            return mutStr;
            
        }
            break;
            
        //以单词为单位
//        case PPMakeStringInvertStyleWordByWord:
//        {
//            stringReverse([str cStringUsingEncoding:NSASCIIStringEncoding]);
//        }
//            break;
            
        default:
            return @"";
            break;
    }
}


void stringReverse(char *p)
{
    char c[100][100];
    int i=0;
    int j=0;
    while (*p!='\0') {
        if(*p==' '){
            i++;
            j=0;
        }else{
            c[i][j] = *p;
            j++;
        }
        p++;
    }
    
    for (int k=i; k>=0; k--) {
        printf("%s",c[k]);
        if (k>0) {
            printf(" ");
        }else{
            printf("\n");
        }
    }
}


@end
