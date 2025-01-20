# Github & Git cheat sheet

## Github - first-time setup

First up, create an account on Github.com, if you don't have one already.

For security reasons, annoyingly, Github does not allow simple passwords for "pushing"
changes from your computer to Github.  You have two options:
* a "personal access token" (PAT)
* set up ssh keys

Both options work, but ssh keys can be set up so you don't need to enter a password, so
that is the option I prefer.

### Personal Access Token

A Personal Access Token is like a password, but it's a long, auto-generated string, and
you can limit what each PAT can be used for.  Good for security, annoying to set up!

This is really hidden in the Github setup menus...

1. On the Github.com main page, sign in, and then click your user icon / avatar in
the top-right corner.  Go down to "Settings".
2. In the left-hand list of settings, go all the way to the bottom for "Developer Settings".
3. In the left-hand list, choose "Personal access tokens", and then "Tokens (classic)".
4. Select the "Generate new token" button, sub-option "Generate new token (classic)".
5. Github will probably make you enter a two-factor code at this point.  Sigh.
6. On the "New personal access token (classic)" page:
* for "Note", just put something like "Numerical methods 2025" just to remind yourself
  when you created this / what it's for.
* for "Expiration"... you can just put "No expiration"
* in "Select scopes"... select "repo".
Then click the "Generate token" button.
7. It should now show you your Personal access token, in a green background.  It will
be a long string starting with "ghp_".
Copy this, and save it somewhere!  Once you close this web page, you won't be able to
get it again, and will have to create a new PAT.

Now, once you've got your PAT, you can copy-n-paste that when
Github asks for a Username/Password when you're "pushing" changes.
(You can just enter it as your Username and leave the Password blank.)

### Secure shell / ssh keys

1. On your computer: open a shell (Windows: open your WSL environment.  Mac: open a Terminal).
2. Try: `cd ~/.ssh`.  If it says "No such file or directory", or something like that:
  * Run `mkdir -m 700 ~/.ssh` to create this directory.  Since it starts with a dot, `ls` may not show it; use `ls -a` (a for "all") to show files and directories that start with dots.
  * Run `cd ~/.ssh`
3. Run `ssh-keygen -f id_github`.  It will probably ask you to `Enter passphrase (empty for no passphrase):`.  You can leave that blank (just hit Enter).
  This will generate two files: `id_github` is your "Private key".  `id_github.pub` is your "Public key".
4. Run `cat id_github.pub` to print out your public key.  Copy that into your clipboard.  It will look something like:
`ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIArYyOwaijvozVm+PIQrDdRRU+akj0z+cyDbfh8I4tSy dstn@MacBook-Pro-5.local`
5. Run `touch config`.  This will create a new, empty, SSH config file if it doesn't already exist.
6. Run `chmod 644 config`.  This sets the permissions for that SSH config file.
7. Edit the `config` file with your favorite editor: maybe `nano config`.
8. Add this to the config file:
```
Host github.com
ForwardX11 no
ForwardAgent no
IdentityFile ~/.ssh/id_github
IdentitiesOnly yes
AddKeysToAgent yes
```
Save the file and quit your editor.  This will tell the "ssh" (secure shell) program to use your new `id_github` key whenever it is talking to `github.com`.
9. Now go to your web browser and go to the Github.com main page.  Sign in, and then click your user icon / avatar in
the top-right corner.  Go down to "Settings".
10. In the left-hand list, go to "SSH and GPG keys".
11. Click the "New SSH key" button.
12. On the "Add new SSH Key" page:
  * for "Title", put something like "Numerical methods 2025: id_github.pub"
  * for "Key Type", leave it on "Authentication key".
  * for "Key": paste in your `id_github.pub` public key.  NOTE: you must always keep the "private" part of your key private!  You only give out the ".pub" part.
Click the "Add SSH Key" button.



## Github -- handing in your homework

We want you to get a little bit of experience using Git and Github, that is why we're asking you to do this.

Git and Github are very widely (almost universally) used in the commercial software development world, so this is a good transferrable skill to learn.

A git project is called a "Repository".  A repository holds the entire history of a set of files and directories.  You can keep many versions of your work,
go back to previous versions, send it to Github, and so on.

### Fork

To start, you are going to make a "Fork" of my "PSI-Numerical-Methods-2025" repository.

1. In your web browser, go to https://github.com/PerimeterInstitute/PSI-Numerical-Methods-2025
2. Sign in to Github
3. Click the "Fork" button.  This will take you to a page to "Create a new fork".  No need to change any of the settings, so click the "Create fork" button.
4. This will create a copy of the "PSI-Numerical-Methods-2025" repository.  The "official" one is "PerimeterInstitute/PSI-Numerical-Methods-2025",
but now you have your own copy, "your-user-name/PSI-Numerical-Methods-2025".

### Clone

After creating your fork on Github, you will "check out" or "clone" that repository to your computer.

In your web browser, if you are looking at your fork of the PSI-Numerical-Methods-2025 repository, look for the green "Code" button, and select it.
You will see "HTTPS", "SSH" and "GitHub CLI" tabs.

If you set up a Personal access token, then use "HTTPS".  If you set up an SSH key, then use "SSH".

Use the "clipboard" button to copy the URL to your clipboard -- eg for HTTPS it will be something like
`https://github.com/your-user-name/PSI-Numerical-Methods-2025.git`, and for SSH it will be something like
`git@github.com:your-user-name/PSI-Numerical-Methods-2025.git`

Start a shell (Windows: start your WSL environment.  Mac: open a Terminal).

1. `cd` into the directory where you want to check out your repository.  If you don't really care, your home directory is probably fine; just do `cd`.
2. Type `git clone` and then paste in the URL from above.  Eg, for me it will be `git clone git@github.com:dstndstn/PSI-Numerical-Methods-2025.git`.
This will print something like
```
Cloning into 'PSI-Numerical-Methods-2025'...
remote: Enumerating objects: 34, done.
remote: Counting objects: 100% (34/34), done.
remote: Compressing objects: 100% (27/27), done.
remote: Total 34 (delta 10), reused 15 (delta 1), pack-reused 0 (from 0)
Receiving objects: 100% (34/34), 7.89 MiB | 2.99 MiB/s, done.
Resolving deltas: 100% (10/10), done.
```
This creates a new directory "PSI-Numerical-Methods-2025".

### Use it

After checking out / cloning your fork of the repository, your "PSI-Numerical-Methods-2025" repository contains copies of all the files.

Start with a `cd` into that directory.

If you make changes that you want to save, you must first use `git commit` to save the current version on disk into your _local_ repository.
You have to specify which file(s) you want to commit - you can use `-a` for "all".  Git will ask you to write a message describing your changes.
You can do this on the command line using the `-m` (message) flag.  For example,
```
git commit -a -m "fixed some typos in homework 1"
```

Now, if you want to send the changes to your _local_ repository "up" to github.com, you can use the
```
git push
```
command.  If you set up a Personal Access Token, git will ask for your Username/Password here; copy-n-paste your PAT.  If you set up SSH, it should not ask for a password.

After you have done a `git push`, you should be able to go to Github.com and see your changes.

The counterpart of `git push` is... you'll never guess... `git pull`, which pulls changes from Github.com to your local computer.

If you work on more than one computer, this can be a convenient way to move versions of files between computers and make sure you don't lose any changes.

To see the status of your directory,
```
git status
```
... but explaining everything it shows you is a bit out of scope here.

To make git track a new file,
```
git add FILENAME
```
and then `git commit` etc.

To see all the commits,
```
git log
```

### "Handing in" your homework.

We will ask you to send us the URL of your forked repository on Github.  Eg, mine would be `https://github.com/dstndstn/PSI-Numerical-Methods-2025`.

