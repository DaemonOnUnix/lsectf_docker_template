#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    puts("This is a test challenge that will be used to test the challenge system.");
    fflush(stdout);
    puts("Enter 1 to validate the test challenge");
    fflush(stdout);
    char buf[0x100];
    fgets(buf, 0x100, stdin);
    while(strcmp(buf, "1\n"))
    {
        puts("Try again !");
        fflush(stdout);
        fgets(buf, 0x100, stdin);
    }
    puts("You got this !");
    fflush(stdout);
    system("/bin/sh");
    return 0;
}