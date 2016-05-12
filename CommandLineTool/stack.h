//
//  stack.h
//  iOSDemo
//
//  Created by Kevin on 16-5-12.
//
//

#ifndef iOSDemo_stack_h
#define iOSDemo_stack_h

//结点的数据类型
typedef struct Node
{
    int data;
    struct Node *pNext;
}NODE, *PNODE;    //NODE ==struct Node,pNODE==struct Node *

//栈
typedef struct Stack
{
    PNODE pTop;//头指针
    PNODE pBottom;//底指针
}STACK, *PSTACK;

void init(PSTACK pS);
void push(PSTACK pS,int val);
int pop(PSTACK pS,int *pVal);
void traverse(PSTACK pS);
int empty(PSTACK pS);
void clearStack(PSTACK pS);


#endif