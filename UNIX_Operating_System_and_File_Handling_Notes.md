# UNIX Operating System and File Handling

## 1. What Is an Operating System?

An **operating system (OS)** is system software that manages a
computer's hardware and provides a safe, convenient environment for
programs to run.

It acts as an **interface between applications and hardware resources**.
Applications usually ask the operating system to perform tasks instead
of controlling hardware directly.

### Main responsibilities of an operating system

1.  **Memory management:** Allocates memory to a program before it runs
    and releases that memory when the program finishes.
2.  **Program loading:** Loads a program into allocated memory so the
    CPU can execute it.
3.  **CPU and process management:** Helps manage program execution and
    the resources needed by each process.
4.  **Hardware access:** Provides services that programs use to access
    devices such as disks and terminals.
5.  **Resource cleanup:** After a program finishes, the OS releases
    resources such as memory and makes them available to other programs.

### Simple example

When you open a text editor, the OS loads it into memory, schedules its
execution on the CPU, and helps it read or save files. When you close
it, the OS can release the resources it was using.

------------------------------------------------------------------------

## 2. The UNIX Operating System

**UNIX** is an operating system known for its portability, multiuser
capabilities, and collection of programming tools.

### Why was UNIX written in C?

UNIX was largely rewritten in **C**, a high-level programming language,
rather than being written entirely in assembly language.

-   **Portability:** C makes it easier to adapt the operating system to
    different hardware platforms.
-   **Maintainability:** C code is generally easier to read and maintain
    than large amounts of assembly code.
-   **Development tools:** UNIX provides tools that help programmers
    create, debug, and maintain software.

Portability does not mean that every UNIX program works everywhere
without changes. Some platform-specific adjustments may still be needed.

### What is a shell?

A **shell** is a command interpreter through which a user interacts with
a UNIX system.

The user types a command, and the shell interprets it and requests that
the system perform the appropriate operation.

For example:

``` sh
ls
```

The `ls` command asks the system to list directory entries.

------------------------------------------------------------------------

## 3. UNIX Architecture: Kernel and Shell

UNIX architecture is commonly explained using two important parts: the
**kernel** and the **shell**.

### Kernel

The **kernel** is the core of the operating system. It interacts with
hardware and manages system resources.

Its responsibilities include:

-   Managing memory.
-   Scheduling processes and deciding which processes get CPU time.
-   Managing process priorities.
-   Providing access to hardware and devices.
-   Handling system calls made by programs.

At startup, a boot process loads the kernel into memory. The kernel then
manages the computer's resources while the system runs.

### Shell

The **shell** is the interface between the user and the kernel.

-   It accepts commands from the user.
-   It interprets the commands.
-   It starts programs or requests system services as needed.
-   It displays command output and errors.

### How a command works

1.  The user types a command into the shell.
2.  The shell interprets the command.
3.  The shell runs the relevant program or requests an operating-system
    service.
4.  The kernel manages any required hardware or system resources.
5.  The result is returned and displayed to the user.

### Kernel vs. Shell

  -----------------------------------------------------------------------
  Kernel                              Shell
  ----------------------------------- -----------------------------------
  Core of the operating system        Command interpreter and user
                                      interface

  Interacts directly with hardware    Interprets user commands
  through system mechanisms           

  Manages memory, processes, and      Starts commands and programs
  devices                             

  Works mainly behind the scenes      Is the part a user commonly
                                      interacts with in a terminal
  -----------------------------------------------------------------------

**Remember:** The kernel communicates with and manages hardware
resources; the shell communicates with the user.

------------------------------------------------------------------------

## 4. Handling Files in UNIX

UNIX stores and organizes data in **files**. Files have names, and
directories group files and other directories together.

A directory is similar to a folder on a graphical desktop.

The following commands are used to create, display, copy, rename, and
remove files.

### 4.1 Create a file with `echo`

The `echo` command prints text. With output redirection (`>`), its
output can be written to a file.

``` sh
echo date > foo
```

This creates a file named `foo` containing the word `date` followed by a
newline. If `foo` already exists, `>` overwrites its contents.

Other ways to create or edit a file include:

``` sh
cat > foo
vi foo
```

-   `cat > foo` accepts text from the terminal until the input is ended
    (commonly with `Ctrl+D`).
-   `vi foo` opens the file in the `vi` text editor; depending on the
    system, the file is created when it is saved.

### 4.2 Display file contents with `cat`

The `cat` command can display the contents of a file.

``` sh
cat foo
```

This prints the contents of `foo` in the terminal.

### 4.3 Copy a file with `cp`

The `cp` command copies a file.

``` sh
cp foo foo.sh
```

This copies the contents of `foo` into a new file named `foo.sh`. The
original file remains unchanged.

General form:

``` sh
cp source destination
```

### 4.4 Rename a file with `mv`

The `mv` command can rename a file or move it to another location.

``` sh
mv foo.sh foo.shell
```

This renames `foo.sh` to `foo.shell` when both names refer to files in
the same directory.

To check the files in the current directory:

``` sh
ls
```

### 4.5 Remove a file with `rm`

The `rm` command removes a file.

``` sh
rm foo.shell
```

After this command, `foo.shell` is removed, while other files such as
`foo` remain.

**Caution:** `rm` can permanently remove files. Check the filename
carefully before running it.

### Quick command reference

  -------------------------------------------------------------------------
  Command                 Purpose                 Example
  ----------------------- ----------------------- -------------------------
  `echo`                  Prints text; can write  `echo hello > note.txt`
                          it to a file with `>`   

  `cat`                   Displays file contents  `cat note.txt`
                          or reads terminal input 

  `cp`                    Copies a file           `cp note.txt copy.txt`

  `mv`                    Renames or moves a file `mv copy.txt new.txt`

  `rm`                    Removes a file          `rm new.txt`

  `ls`                    Lists directory entries `ls`
  -------------------------------------------------------------------------

------------------------------------------------------------------------

## 5. The UNIX File System Hierarchy

UNIX organizes files and directories in a tree-like structure.

### Root directory: `/`

The top of the hierarchy is the **root directory**, represented by a
single forward slash:

``` text
/
```

All files and directories belong somewhere under this root. The root
directory is not the same as the `root` user account.

### Subdirectories

The root directory contains subdirectories. Those directories may
contain further subdirectories and files, creating a hierarchy.

A simplified example:

``` text
/
├── bin
├── dev
├── home
│   ├── user1
│   │   ├── notes.txt
│   │   └── .profile
│   └── user2
├── tmp
├── usr
└── var
```

This is an illustrative structure; the exact directories and layout can
differ between UNIX-like systems.

### Common directory names

-   `/bin`: Common user commands on systems that use this traditional
    layout.
-   `/dev`: Device files representing or providing access to devices.
-   `/home`: Home directories for users on many UNIX-like systems.
-   `/tmp`: Temporary files.
-   `/usr`: Many user applications, libraries, and shared resources.
-   `/var`: Variable data such as logs and caches.

Modern Linux distributions may organize some of these directories
differently or use symbolic links, but the tree structure remains an
important concept.

### Absolute and relative paths

An **absolute path** starts from the root directory (`/`), for example:

``` text
/home/user1/notes.txt
```

A **relative path** is interpreted from the current working directory,
for example:

``` text
notes.txt
```

------------------------------------------------------------------------

## 6. Listing Files with `ls`

The `ls` command lists files and directories.

### List the current directory

``` sh
ls
```

With no arguments, `ls` lists entries in the current working directory.
Output formatting varies by system and terminal settings.

### Check specific names

``` sh
ls calendar /bin/perl
```

This asks `ls` to check or list the named paths:

-   If `calendar` exists, its name or listing is shown.
-   If `/bin/perl` exists, it is listed.
-   If a path does not exist, `ls` prints an error such as
    `No such file or directory`.

The exact message and output formatting can vary.

### List the contents of a directory

``` sh
ls helpdir
```

If `helpdir` is a directory, `ls` displays the entries inside it. If it
is a file, `ls` displays information about that file's name.

### Useful variations

``` sh
ls -l
ls -a
ls -la
```

-   `ls -l`: Long listing, with details such as permissions, owner,
    size, and modification time.
-   `ls -a`: Includes hidden entries whose names begin with a dot (`.`).
-   `ls -la`: Combines the long listing and hidden-entry options.

------------------------------------------------------------------------

## 7. Worked Example: File Commands in Order

The following sequence demonstrates creating, viewing, copying,
renaming, and deleting files.

``` sh
echo "UNIX notes" > foo
cat foo
cp foo foo.sh
ls
mv foo.sh foo.shell
ls
cat foo.shell
rm foo.shell
ls
```

What happens:

1.  `echo "UNIX notes" > foo` creates `foo` or overwrites it with the
    text.
2.  `cat foo` displays the text.
3.  `cp foo foo.sh` creates a copy named `foo.sh`.
4.  `ls` lists the current directory entries.
5.  `mv foo.sh foo.shell` renames the copy.
6.  `ls` shows the updated names.
7.  `cat foo.shell` displays the copied text.
8.  `rm foo.shell` removes the renamed copy.
9.  The final `ls` confirms that `foo.shell` is no longer listed; `foo`
    remains.

Run these commands only in a practice directory where overwriting or
removing the example filenames is safe.

------------------------------------------------------------------------

## 8. Important Points to Remember

-   An **operating system** manages hardware and provides services to
    programs.
-   The **kernel** is the core of UNIX and manages hardware resources,
    memory, and processes.
-   The **shell** interprets user commands and acts as the user-facing
    command interface.
-   UNIX was written largely in **C**, helping make it portable across
    hardware platforms.
-   `echo text > file` writes text to a file; `>` overwrites an existing
    file.
-   `cat file` displays file contents.
-   `cp source destination` copies a file.
-   `mv old new` renames or moves a file.
-   `rm file` removes a file.
-   `ls` lists directory entries.
-   `/` is the root of the file-system hierarchy.

## 9. Quick Practice Questions

1.  What is an operating system?
2.  What are the main responsibilities of the kernel?
3.  How is a shell different from a kernel?
4.  Why did writing UNIX in C help portability?
5.  What does `echo hello > a.txt` do?
6.  What is the difference between `cp` and `mv`?
7.  Which command displays the contents of a file?
8.  Which command removes a file?
9.  What does `/` represent in the UNIX file system?
10. What is the difference between an absolute path and a relative path?

### Answers

1.  System software that manages hardware and provides services for
    programs.
2.  It manages memory, processes, CPU scheduling, devices, and system
    calls.
3.  The kernel manages system resources; the shell interprets commands
    from the user.
4.  C is more portable and easier to maintain across hardware than
    assembly code.
5.  It writes `hello` to `a.txt`, replacing its previous contents if the
    file exists.
6.  `cp` creates a copy; `mv` moves or renames.
7.  `cat`.
8.  `rm`.
9.  The top-level root directory.
10. An absolute path starts at `/`; a relative path starts from the
    current working directory.
