// All intellectual credit to Vincent Moscatello https://github.com/quantumvm
#include <stdio.h>

typedef struct foobar{
    void (*function) ();
    char buffer[64];
}foobar;


void you_lose(){
    puts("yak yak yak GET A JOB!");
}

void you_win(){
    puts("HACK THE PLANET");
}


foobar test;

int main(){

    puts("This is the Mocking game. The only way to win is");
    puts("not to play!");

    char buffer[128];
    test.function = you_lose;

    fgets(buffer, sizeof(buffer), stdin);
    printf(buffer);

    test.function();

}
