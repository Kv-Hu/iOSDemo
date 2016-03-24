//
//  main.c
//  基础 C 语言学习
//
//  Created by 胡 开文 on 16-3-24.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
  //  printf("Hello, World!\n");
    
    //打印矩形
    
    //    for (int i = 1; i <=5; i++) {
    //
    //        for (int j = 1; j <= i; j++) {
    //            printf(" * ");
    //        }
    //
    //        printf("\n");
    //
    //
    //    }
    
    //    /// 打印行号
    //    for (int i = 1; i<= 5; i++) {
    //
    //        for (int j= 1; j<= i; j++) {
    //            printf("%d ",i);
    //        }
    //
    //        printf("\n");
    //    }
    //
    //    //打印列号
    //    for (int i = 1; i<= 5; i++) {
    //
    //        for (int j= 1; j<= i; j++) {
    //            printf("%d ",j);
    //        }
    //
    //        printf("\n");
    //    }
    //
    //
    //打印99乘法表
    
    for (int i = 1; i<= 9; i++) {
        
        for (int j = 1; j<= i; j++) {
            printf("%d * %d = %d  ",j,i,j*i);
        }
        
        
        printf("\n");
        
        
    }
    
    
    return 0;
}



