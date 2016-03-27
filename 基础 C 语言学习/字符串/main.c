//
//  main.c
//  字符串
//
//  Created by 胡 开文 on 16-3-27.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.







/*

 判断字符串中 是否含有某个字符 i 如果含有则返回其首次出现的位置下标注，否则返回 -1

 */


int serch(char ch[],char key){
    
    int i = 0;
    while (ch[i] != '\0') {
        if (ch[i] == key) {
            return i;
        }
        i++;
    }
    return -1;

}

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    //printf("Hello, World!\n");
    
    
    char ch[] = "qwefjidufidshdsnvd";
    
    
   printf("%d\n", serch(ch, 'p'));

    return 0;
}

