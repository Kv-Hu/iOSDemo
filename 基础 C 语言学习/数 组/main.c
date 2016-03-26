//
//  main.c
//  数 组
//
//  Created by 胡 开文 on 16-3-26.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

int pd(int x){

    if (x > 0) {
        return x;
    } else {
        return 0;
    }



}





int main(int argc, const char * argv[])
{

    // insert code here...
   // printf("Hello, World!\n");
    
    
    int a[6] = {-1,2,-8,5,3,-6};
    for (int i = 0; i < 6; i++) {
        printf("%d\n",pd(a[i]));
    }
    
    
    
    
    return 0;
}

