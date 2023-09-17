# BASH QUICK REFERENCE
 
# bypass an alias
prepend the command with a backslash

# misc terminal stuff
neofetch does the cool ascii art thing
ctrl + a acts like home
ctrl + e acts like end
ctrl + h acts like backspace
ctrl + l acts like clear
ctrl + j acts like enter
ctrl + w acts like ctrl + backspace in normal text editors
alt + leftarrow or alt + rightarrow act like ctrl + arrows in other text editors

# job control
you already know about ctrl-c to stop a running program.
to test this kind of thing, you can use the "sleep" command, which takes a
number of seconds.

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
