//
//  zanshi.c
//  基础 C 语言学习
//
//  Created by 胡 开文 on 16-3-25.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include "zanshi .h"
#include "jisuan.h"

void show(int x,int y){

    printf("*******************\n");
    
    printf("%d + %d = %d\n",x,y,add(x, y));
    
    printf("*******************\n");

}
