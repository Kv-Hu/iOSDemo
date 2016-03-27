//
//  main.c
//  指针  四则运算
//
//  Created by 胡 开文 on 16-3-27.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.
//




// 用指针 实现两个整形数的  四则运算

void operation(int x,int y,int *p1,int *p2,int *p3,float *p4){
    
    * p1 = x + y;
    * p2 = x - y;
    * p3 = x * y;
    * p4 = x/y;
    
    
    
    
}

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    //printf("Hello, World!\n");
    
   int a = 25,b = 15;
    
    int jia,jian,cheng;
    float chu;
    operation(a,b,&jia,&jian,&cheng,&chu);
    printf("x+y= %d,x-y = %d, x*y = %d, x/y = %f\n",jia,jian,cheng,chu);
    
    
    return 0;
}

