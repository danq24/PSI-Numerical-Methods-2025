* Numerical Methods 2025 - Session 1

Dustin Lang

Today, we will introduce and set up some of the tools and services we will use for this course:

- the Julia programming language
- the Github file-versioning service
- the Unix shell

Some of you may already have some of these things set up; please be patient with us, and try to help your fellow students get set up as well.

** Julia

In this course, we are going to use the Julia programming language.  This is a relatively new language, with a mix of high-level usability and a focus on efficient computation.
This makes it a powerful language for numerical methods.

The Julia language homepage is here: https://julialang.org/

** Unix shell / Linux / bash

In this course, we will make use of the Unix shell (also known as "bash", or "the terminal" or "the command line").  This is a very old-timey way of interacting with computers, but it is extremely powerful, and is often the only method available to use High-Performance Computing / supercomputing centers.

Good notes for the Unix shell (including some install/setup instructions) are available from the Carpentries:
https://swcarpentry.github.io/shell-novice/
Note that for Windows, I would suggest using their "For advanced users" instructions to install the Windows Subsystem or Linux (WSL).

** Github

For this course, we will use Github as a way to distribute your homework assignments, and you will also use it to hand in your work.  This is to give you practice using Github, which you will hopefully find to be very useful for your work!

Good notes for Git and Github can be found here, by the Carpentries organization:
https://swcarpentry.github.io/git-novice/
Again, for Windows, they suggest using "Git for Windows", but it would be better if you can install "Windows Subsystem for Linux".

** Environment

Today, we will try to get everyone set up to use Julia, Git, and Bash on their personal laptop computers.  If this does not work, do not worry!  We have a backup option:
the Symmetry cluster/supercomputer is available to all Perimeter Institute folks.  *However*, Symmetry has been down for the last month and is not yet back in service!
(Mondays, am I right?)

Web-based options for running Julia include:

* https://glot.io/new/julia
* https://binder.plutojl.org/
* https://cocalc.com/features/julia


** Text editor

We are going to write code in the Julia language.  Like most programming languages, Julia is written in plain text files.

Many different text editors are available, from the very simple (and old-school) ("nano"), to classic programmer favourites ("vim" and "emacs"),
to newer options like "VSCode" (https://code.visualstudio.com/download)

As an alternative to writing text files, we may also use the Jupyter notebook system for interactive computing.  More on this later!

*** Windows laptops

I am afraid that I have very little experience with Windows, so my instructions here will be very sketchy!  We will figure this out together!

I think the best way is to install the WSL, Windows Subsystem for Linux.  This gives you a local Linux environment where you will be able to run everything we need.
https://learn.microsoft.com/en-us/windows/wsl/install

I do not know exactly what is included in a fresh WSL install -- we will find out!  I am sure that it will have "bash", and maybe "vim" and "nano" and "git".

I believe WSL install an Ubuntu flavour of Linux as its default, and in that case, we can install or update new software packages using the "apt" package installer:
```
apt update
apt install git
apt install nano
```

*** Mac laptops

Life is mostly easier in Mac land, because under the hood it is a Unix-based operating system.  Start by opening your "Applications" and then "Utilities" folder, and find the "Terminal" program.  You'll probably want to make a shortcut to that, because you'll use it a lot in this course!

Recently, Mac has switched the default shell from "bash" to "zsh".  They are mostly the same, but I would recommend using "bash" anyway - either by running the command "bash" each time you start a Terminal (or new Terminal tab), or make it permanent by running the command: "chsh -s /bin/bash"

You *should* have "git" and "nano" (and "vim") built-in.

*** Linux laptops

You are hardcore :)


** Installing Julia

We want to have Julia available in our bash / Unix shell / WSL environment, so the easiest thing to do is use the "juliaup" installer.  From a bash shell, run:
```
curl -fsSL https://install.julialang.org | sh
```
this will start by showing you a text menu where you can proceed with the install (just hit Enter), or change the settings (nothing needs changing).
Your journey into the old-timey world of text interactions with computers has begun!

This "Juliaup" installer will make the "julia" command available in your shell environment, BUT only after you restart "bash"!  So start by running a new "bash".
```
bash
julia
```

This should show you something like
```
> julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.8.5 (2023-01-08)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> 
```

which is Julia's interactive prompt or "REPL".  ("REPL" = "read-eval-print loop" = read in a command, run it, print the output).

** Optional - installing & using Pluto - notebook environment

We will run `julia` and then:
```
import Pkg; Pkg.add("Pluto")
import Pluto; Pluto.run()
```


