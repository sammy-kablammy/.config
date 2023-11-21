#include <stdlib.h>
#include <string.h>
#include "mylib.h"

struct person {
    char *name;
    int birthyear;
};

// create a new person with the given name and birthyear
struct person *make_person(char *name, int birthyear) {
    struct person *new = malloc(sizeof(struct person));
    new->name = strdup(name);
    new->birthyear = birthyear;
    return new;
}

// returns the ACTUAL name, not a copy
char *get_name(struct person *p) {
    return p->name;
}
