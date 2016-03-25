//
//  main.c
//  C语言之函数的嵌套
//
//  Created by 胡 开文 on 16-3-25.
//  Copyright (c) 2016年 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>



// 实现功能： 给500块钱 去买酱油 买完酱油买了一根冰糕   剩下的钱返回给主调函数

// 实现函数 用买酱油剩下的钱 去买冰糕

int buyBG(int money2){

    int z2 = money2 -1;
    printf("买冰糕花了一块钱，剩下%d块钱\n",z2);
    return z2;

}




//实现一个函数  买酱油

int buyJY(int money){

    int z = money - 200;
    printf("买酱油花了200，剩下%d块钱\n",z);
    
    
    //调用 buyBG函数
   int z2 =  buyBG(z);
    
    return z2;
    
    


}




int main(int argc, const char * argv[])
{

    // insert code here...
    //printf("Hello, World!\n");
    // 调用buyJY函数
    
   int lastMoney = buyJY(500);
    printf("还剩下%d块钱\n",lastMoney);
    
    

    return 0;
}

