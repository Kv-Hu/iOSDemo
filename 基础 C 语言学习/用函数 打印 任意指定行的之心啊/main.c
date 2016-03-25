//
//  main.c
//  用函数 打印 任意指定行的之心啊
//
//  Created by 胡 开文 on 16-3-25.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

void showLine(){

    printf("----------------");
    

}

void numLine(){
    int j = 0;

    printf("请输入要打印的行数 ：\n");
    
    scanf("%d",&j);
    for (int i=1; i <= j; i++) {
        showLine();
        printf("%d\n",i);
       
    }




}



int main(int argc, const char * argv[])
{

    // insert code here...
    //printf("Hello, World!\n");
    
    numLine();
    return 0;
}

