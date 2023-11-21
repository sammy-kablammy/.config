#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void print_progress(int percent_done) {
    // printing a carriage return causes the cursor to move back to the
    // beginning of the current line
    printf("\r");
    printf("%d percent done", percent_done);
    fflush(stdout);
}

int main(void) {
    int i;
    int wait_milliseconds = 25;
    for (i = 1; i <= 100; i++) {
        print_progress(i);
        usleep(wait_milliseconds * 1000);
    }
    printf("\n");
    return EXIT_SUCCESS;
}
