# BASH QUICK REFERENCE
 
# misc terminal stuff
ctrl + a acts like home
ctrl + e acts like end
ctrl + h acts like backspace
ctrl + l acts like clear
ctrl + j acts like enter
ctrl + w acts like ctrl + backspace in normal text editors
alt + leftarrow or alt + rightarrow act like ctrl + arrows in other text editors
!! retypes the previous command. very useful for `sudo !!` when you forget sudo.
$# holds the number of command line args
echo $? to see the error code of previous program
echo $_ to see the most recently used command line argument
echo $@ to see all the args
you know > will write to a file, but >> can append text to file
neofetch does the cool ascii art thing
to bypass an alias, prepend the command with a backslash
to open a file as hex/binary, use `xxd myfile` or `xxd -b myfile`

# symlink
to link from one location to another (particularly useful with WSL), use `ln`
you'll probably want a symlink instead of a hard link.
you can look up the difference.
* ln -s /mnt/c/Users/my_windows_folder my_nickname

# operate on a range of files
example: create files 1 through 100:
* touch file{1..100}

# job control
to test this kind of stuff, you can use the "sleep" command, which takes a
number of seconds.

you already know about ctrl-c to stop a running program.

there are tons of signals that shell programs can receive.
typing ctrl-c sends a SIGINT (a signal to interrupt), for example

when writing a program, you can add custom handlers for the different signals.
(notice how vim doesn't stop when you type ctrl-c; it just enters normal mode)

ctrl-z to suspend the currently running task (SIGSTOP)

to start a program running in the background, you can use this syntax:
./myprogramname <args> &

the `jobs` command will list the running jobs.

once you know the id of a job you want to run, you can use an `fg` or `bg`
command followed by the job's id: `fg %1`

you can kill specific tasks without needing to `fg` them first: `kill <id>`

instead of the default kill command, you can pass a specific signal to a job:
`kill -HUP 2` to send a hangup signal to task 2

# font
this is the funny comic sans font:
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/ComicShannsMono.zip
(it's a nerd font so it supports fancy characters and stuff)

i use fonts without ligatures (test ligatures here !=).

for a ligature-positive font, use JetBrains Mono.

# scripting quick reference
start your scripts with `#!/bin/bash`

when writing conditional expressions, you have one condition per [] block.
you can combine these conditions with the standard && and || and ! operators.

- Conditional expressions
```bash
# for numbers, use -ne, -eq, -ge, -lt, and so on
# for strings, use = or !=
if [ $# -eq 1 ]; then
    echo "that's the correct number of command line arguments! hooray!"
elif [ $# -ge 2 ]; then
    echo "too many!"
else
    echo "expected command line argument"
    exit 1
fi
```

- Looping
```bash
for c_file in *.c; do
    echo "This C file is called $c_file"
done
```

- Variables
```bash
# creating variables is simpler than you think
myvar = 10
anothervar = "$1"
```
a note on variables: when assigning or reassigning variables, don't use `$`.
think of the `$` as dereferencing the variable

# awk
(named after aho, weinberger, and kernighan)

Print the first column of tabular data:
* `cat table.txt | awk '{print $1}'`

Printing $0 will just print the entire input as-is

By default, columns are separated by spaces. This is called the field separator.
You can change the field separator with the -F flag. For example: `-F ":"`

Print all the users on your system:
* `awk -F ":" '{print $1}' /etc/passwd`
Also include the sixth column, separating the columns by a tab character
* `awk -F ":" '{print $1 "\t" $6}' /etc/passwd`

You can also search using regexes, just like grep.
Search for all lines that begin with a '#'
* `awk '/#/' myfile.txt`
Search for any line containing "fun" or "file"
* `awk '/fun|file/' myfile.txt`
etc.

# sed
sed's method of file IO is strange. use a left chevron to indicate the input
file, right for output (output file can be omitted).
Replace all instances of HEAD with TAIL:
* `sed 's/HEAD/TAIL/g' <table.txt`
Pipe some text into sed:
* `echo "howdy yall" | sed 's/y/EEE/'`
Use the same file for input and output:
* `sed -i '/s/hi/ho/g' myfile.txt`

# gdb tips
run with `--tui` to preview source code
