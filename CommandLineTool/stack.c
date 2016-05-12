//
//  stack.c
//  iOSDemo
//
//  Created by Kevin on 16-5-12.
//
//

#include <stdio.h>
#include <stdlib.h>
#include "stack.h"

//初始化
void init(PSTACK pS)
{
    pS->pTop = (PNODE)malloc(sizeof(NODE));//为pTop分配存储空间
    if(pS->pTop == NULL)
    {
        printf("内存分配失败！\n");
        exit(-1);
    }else{
        
        pS->pBottom = pS->pTop;//指向同一个空结点
        pS->pTop->pNext = NULL;//指向的头结点指针域为空
        
    }
}
//入栈
void push(PSTACK pS,int val)
{
    PNODE pNew = (PNODE)malloc(sizeof(NODE));//给新结点分配存储空间
    pNew->data = val;//给新结点数据域赋值val
    pNew->pNext =  pS->pTop;
    pS->pTop = pNew;    //pTop指向新的结点
}



//遍历输出
void traverse(PSTACK pS)
{
    
    PNODE p = pS->pTop;//定义一个指针
    
    while (p != pS->pBottom) {
        printf("%d      ",p->data);
        p =  p ->pNext;
    }
    printf("\n");
}

//把pS所指向的栈出栈一次，并把出栈的元素存入pVal所指向的变量中，如果出栈成功返回1，失败返回0

//判空
int empty(PSTACK pS)
{
    
    if(pS->pTop==pS->pBottom){
        return 1;
    }else{
        return 0;
    }
}


//出栈
int pop(PSTACK pS,int *pVal)
{
    if (empty(pS)) {
        return 0;
    }else{
        PNODE r= pS->pTop;//创建一个指针
        *pVal = r->data;
        pS->pTop = r->pNext;
        free(r);//释放
        r=NULL;
        
        return 1;
    }
}

// 清空栈   要点：创建两个指针 p  q.
void clearStack(PSTACK pS)

{
    if (empty(pS)) {
        return;
    }else{
        
        PNODE p = pS->pBottom;
        PNODE q = NULL;
        
        while (p!=pS->pBottom) {
            q = p->pNext;
            free(p);
            p = q;
        }
        pS->pTop = pS->pBottom;
    }
    
}
