#include "vexsatv.h"

void print(const char*str){
    while(*str){
        uart_write(UART,*str);
        str++;
    }
}

void println(const char*str){
    print(str);
    uart_write(UART,'\n');
}

void delay(uint32_t count)
{
    volatile uint32_t i, j;
    for (i = 0; i < count; i++)
    {
        for (j = 0; j < count; j++)
        {
            __asm__ volatile ("nop");
        }
    }
}

int main(void) {

    while (1)
    {
        println("hello world zcu104 v1");
        delay(1000);
    }

    return 0;
}
