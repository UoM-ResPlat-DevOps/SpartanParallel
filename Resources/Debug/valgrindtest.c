#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int main(void)
{
    char *ptr = (char*)malloc(10);
    memset(ptr, 0, 10);

    strncpy(ptr, "Linux", strlen("Linux"));

    printf("\n ptr = [%s]\n", ptr);
    ptr[0] = 'a';
    printf("\n ptr = [%s]\n", ptr);

    return 0;
}

