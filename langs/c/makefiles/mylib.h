// This prevents double includes.
#ifndef PERSON_H
#define PERSON_H

typedef struct person person;

struct person *make_person(char *name, int birthyear);
char *get_name(struct person *p);

#endif // PERSON_H
