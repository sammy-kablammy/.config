#include <stdio.h>
#include "mylib.h"

int main(void) {
    puts("sample c program");
    person *p = make_person("sam", 2004);
    puts(get_name(p));
    return 0;
}
