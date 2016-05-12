//
//  main.c
//  CommandLineTool
//
//  Created by Kevin on 16-5-12.
//
//

#include <stdio.h>
#include <stdlib.h>
#include "list.h"
#include "stack.h"


int main()
{
    //linklist
    list *l;
    int i;
    datatype arr[] = {12,9,23, 2,34,6,45};
    
    
    l = list_create();
    if (l == NULL)
        exit(1);
    
    for (i = 0; i < sizeof(arr)/sizeof(*arr); i++)
    {
        if (list_order_insert(l, &arr[i]))
            exit(1);
    }
    
    list_display(l);
    
    int err;
    datatype value;
    err = list_delete_at(l, 2, &value);
    if (err)
        exit(1);
    list_display(l);
    printf("delete:%d\n",value);
    
    /*
     int value = 12;
     list_delete(l , &value);
     list_display(l);
     */
    list_destroy(l);
    
    
    //栈
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