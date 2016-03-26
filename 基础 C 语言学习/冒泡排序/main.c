//
//  main.c
//  冒泡排序
//
//  Created by 胡 开文 on 16-3-26.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.







// int a[]={10,15,19,2,3,58,34,19};将这个数组从小到大排列

#include <stdio.h>

int main(int argc, const char * argv[])

{

    // insert code here...
   // printf("Hello, World!\n");
 
    
    int a[]={10,15,10,2,3,58,34,19};
    
 //1.计算 数组a的长度
    int len = sizeof(a)/sizeof(int);
    //2.排列  （冒泡排序）
    
    for (int i =0; i < len - 1; i++) {
        for (int j = 0; j < len -1 - i; j++) {
            
            if (a[j] > a[j+1]) {
                
                int tmp = 0;
                
                tmp = a[j];
                
                a[j] = a[j+1];
                
                a[j+1] = tmp;
            }
       
        }

    }
    for (int i = 0; i <len; i++) {
        printf("%d    ",a[i]);
    }
    return 0;
}

