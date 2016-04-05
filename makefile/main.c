#include <stdio.h>


    struct BirthDay{

        int day;
        int month;
        int year;
    };
    struct Students{
        int age;
        int sex;
        char *name;
        struct BirthDay birthday ;
    };
int main(int argc, const char * argv[]){

    struct Students p1;
    p1.name = "Mike";
    p1.age = 18;
    p1.sex = 1;
    p1.birthday.day = 6;
    p1.birthday.month = 10;
    p1.birthday.year = 1992;
    
    printf("The student's name is %s,he is %d years old,his birthday is %d - %d -%d\n",p1.name,p1.age,p1.birthday.year,p1.birthday.month,p1.birthday.day);

    return 0;

}
