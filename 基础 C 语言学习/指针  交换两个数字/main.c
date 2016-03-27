//
//  main.c
//  指针  交换两个数字
//
//  Created by 胡 开文 on 16-3-27.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.
//


//  int a = 10; int b =20;利用指针 使得a 和 b的值 相互交换



void change(int *p1,int *p2){

    int tmp = *p1;
    *p1 = *p2;
    *p2 = tmp;

}




#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
   // printf("Hello, World!\n");
    
    int a = 10,b = 20;
    printf("交换之前-----> a = %d,b = %d\n",a,b);
    
    change(&a,&b);
    printf("交换之后-----> a = %d,b = %d\n",a,b);
    
    
    return 0;
}

