



#include<stdlib.h>
#include<stdio.h>


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

int main(void)
{
    STACK S;    //创建一个变量S，存储空间里面有PTop和PBottom,没有存放有效的数据，STACK等价于 struct Stack
    int val;
    init(&S); //初始化 目的是造出一个空栈
    push(&S, 1); //入栈
    push(&S, 2);
    push(&S, 3);
    push(&S, 4);
    push(&S, 5);
    push(&S, 6);
    traverse(&S);
    
    if (pop(&S,&val))
    {
        printf("出栈成功，出栈的元素是%d\n",val);
    }else{
        printf("出栈失败！\n");
    }
    
    
    traverse(&S); //遍历
    clearStack(&S);//清空栈
    traverse(&S);//遍历
    return 0;
}


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
