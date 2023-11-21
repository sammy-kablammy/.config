# random note: you can use `objdump -d myfile.o` to see disassembly

# using `.SILENT` prevents boring compiler output, except for warnings/errors
# (for a one-time silencing, use the -s flag)
# .SILENT:

# theory:
# makefiles are lists of rules. a rule has a target and prerequisites.
# for example, your program 'myprogram.c' might depend on 'mylib.c'
# $@ represents the target
# $^ represents all the prerequisites

# in summary, the following rule says that all .o files prerequire .c files,
# and they should be generated using the following command
# %.o: %.c
# 	$(CC) $(CFLAGS) -c $^ -o $@

# you might also decide to use a fancy file structure:
# obj/%.o: src/%.c
# 	$(CC) $(CFLAGS) -c $^ -o $@

# you can name the variables whatever you want; CC and CFLAGS are common
CC=gcc
CFLAGS=-g -Wall

# i don't know what this does
# all: myprogram

myprogram: myprogram.c mylib.o
	$(CC) $(CFLAGS) myprogram.c mylib.o -o myprogram

# note: gcc optimization goes from OO (default) to O3ish
# level 2 is common apparently
optimize_flags=-O2

optimizeme: myprogram.c mylib.o
	$(CC) $(optimize_flags) myprogram.c mylib.o -o myprogram

# note: `-c` means to skip the linking step and 
justlib: mylib.c
	$(CC) $(CFLAGS) -c mylib.c -o mylib.o

clean:
	rm *.o myprogram
