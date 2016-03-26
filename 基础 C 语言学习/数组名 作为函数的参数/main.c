//
//  main.c
//  数组名 作为函数的参数
//
//  Created by 胡 开文 on 16-3-26.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.





// 数组名 作为 函数的实参  传递的   实际上是  ：  地址，数组的地址

#include <stdio.h>

void xiEgg(int Oegg[]){

    for (int i = 0; i<3; i++) {
        printf("洗了%d\n",Oegg[i]);
    }
   
    printf("洗完了");


}


int main(int argc, const char * argv[])
{

    // insert code here...
    //printf("Hello, World!\n");

    int egg[3] = {10,20,30};
    
    
      xiEgg(egg);
    
    
    
    
    
    
    return 0;
}

