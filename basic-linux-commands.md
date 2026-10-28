# UNIX and Basic Linux Commands — Complete Study Notes

**Suggested file name:** `UNIX_Linux_Commands_Complete_Notes.md`

These notes cover the operating system, UNIX architecture, file-system hierarchy, and basic Linux commands with syntax, examples, explanations, and practice exercises. Commands and options can vary between Linux distributions, UNIX systems, macOS, and Git Bash.

---

# Part 1: Operating System and UNIX

## 1. What Is an Operating System?

An **operating system (OS)** is system software that manages computer hardware and provides an environment in which programs can run. It acts as an interface between applications and hardware resources.

### Main responsibilities
- **Memory management:** Allocates memory to programs and releases it when no longer needed.
- **Program loading:** Loads programs into memory so the CPU can execute them.
- **Process management:** Schedules processes and manages their use of the CPU.
- **Hardware access:** Provides services for accessing disks, terminals, and other devices.
- **Resource cleanup:** Releases resources after a program finishes.

**Example:** When you open a text editor, the OS loads it into memory and helps the CPU execute it. When you save a document, the application requests operating-system services to write data to storage.

## 2. The UNIX Operating System

**UNIX** is an operating system known for portability, multiuser capabilities, and programming tools.

### Why is UNIX associated with C?
UNIX was largely rewritten in **C**, a high-level programming language, rather than being written entirely in assembly language.

- **Portability:** C makes it easier to adapt software to different hardware platforms.
- **Maintainability:** C code is generally easier to read and modify than large amounts of assembly code.
- **Development tools:** UNIX provides tools for developing, debugging, and maintaining programs.

Portability does not guarantee that every program works on every system without changes.

### What is a shell?
A **shell** is a command interpreter that lets users interact with the operating system by entering commands.

```bash
ls
```

The shell interprets the command and runs the appropriate program or requests the necessary system services.

## 3. UNIX Architecture: Kernel and Shell

### Kernel
The **kernel** is the core of the operating system. It manages system resources and provides services that programs need.

Its responsibilities include:
- Managing memory.
- Scheduling processes and CPU time.
- Managing devices and other resources.
- Handling system calls from programs.

### Shell
The **shell** is the command-line interface between the user and the operating system. It accepts commands, interprets them, starts programs or requests system services, and displays output and errors.

| Kernel | Shell |
|---|---|
| Core of the operating system | Command interpreter |
| Manages memory, processes, and devices | Interprets user commands |
| Works mainly behind the scenes | Commonly used in the terminal |

**Remember:** The kernel manages system resources; the shell interprets user commands.

## 4. The UNIX File-System Hierarchy

UNIX organizes files and directories in a tree-like structure.

### Root directory `/`
The top of the hierarchy is the **root directory**, represented by `/`. All files and directories are located under it. The root directory is not the same as the `root` user account.

```text
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

This is an illustrative structure; exact layouts vary across systems.

Common directory names:
- `/bin`: Common commands on systems using this traditional layout.
- `/dev`: Device files.
- `/home`: User home directories on many systems.
- `/tmp`: Temporary files.
- `/usr`: Many applications, libraries, and shared resources.
- `/var`: Variable data such as logs and caches.

### Absolute and relative paths
- **Absolute path:** Starts from `/`, e.g. `/home/user1/notes.txt`.
- **Relative path:** Is interpreted from the current directory, e.g. `notes.txt`.

---

# Part 2: Basic Linux Commands

## 5. `echo` Command

**Purpose:** Displays text in the terminal or writes text into a file.

### Syntax
```bash
echo "text"
echo "text" > filename.txt
echo "text" >> filename.txt
```

### Display text
```bash
echo "Hello World"
```

Output:
```text
Hello World
```

### Write text into a file
```bash
echo "Hello World" > file1.txt
```

This creates `file1.txt` if it does not exist. If it already exists, `>` overwrites its contents.

### Append text to a file
```bash
echo "Good Evening All" >> file1.txt
```

This adds text to the end of the file without removing its existing contents.

**Remember:**
- `>` redirects output to a file and overwrites its contents.
- `>>` redirects output by appending to the file.

## 6. `cat` Command

**Purpose:** Displays file contents, accepts keyboard input into a file when redirected, and can combine files.

### Syntax
```bash
cat filename.txt
cat > filename.txt
cat file1.txt file2.txt
```

### Display file contents
```bash
cat file1.txt
```

### Create a file using keyboard input
```bash
cat > file1.txt
```

Type your text, then press **Ctrl+D** on a new line to end input. The `>` symbol means an existing file with the same name will be overwritten.

### Display two files
```bash
cat file1.txt file2.txt
```

This displays both files in order. `cat` by itself reads standard input until the input ends, commonly with `Ctrl+D`.

## 7. `cp` Command

**Purpose:** Copies files. Copying directories generally requires an option such as `-r`.

### Syntax and example
```bash
cp source destination
cp f2.txt f3.txt
```

- `f2.txt` is the source.
- `f3.txt` is the destination.
- If `f3.txt` does not exist, it is created.
- If it already exists, its contents may be overwritten.

Verify the copied file:
```bash
cat f3.txt
```

Copy a directory and its contents:
```bash
cp -r folder1 folder2
```

Be careful when the destination already exists because the resulting directory structure depends on the paths supplied.

## 8. `mv` Command

**Purpose:** Moves a file to another location or renames it.

### Rename a file
```bash
mv file1.txt file2.txt
```

If `file2.txt` does not exist, this renames `file1.txt` to `file2.txt`.

### Move a file into a directory
```bash
mv file1.txt documents/
```

This moves `file1.txt` into the existing `documents` directory.

**Caution:** If the destination is an existing file, it may be overwritten. Check the destination before using `mv`.

## 9. `rm` and `rmdir` Commands

### `rm` — Remove files
```bash
rm file1.txt
```

Remove multiple files:
```bash
rm file1.txt file2.txt
```

Remove a directory and its contents:
```bash
rm -r directory_name
```

**Caution:** `rm` usually does not send files to the Recycle Bin. Deletion may be difficult to reverse. Check paths and filenames before running it.

### `rmdir` — Remove an empty directory
```bash
rmdir documents
```

This removes `documents` only if it is empty.

**Remember:** `rm` removes files; `rmdir` removes empty directories.

## 10. `mkdir` Command

**Purpose:** Creates a directory (folder).

### Create one directory
```bash
mkdir myfolder
```

### Create multiple directories
```bash
mkdir folder1 folder2 folder3
```

### Create parent directories as needed
```bash
mkdir -p projects/linux/notes
```

The `-p` option creates missing parent directories and does not report an error merely because the requested directory already exists.

## 11. `pwd` Command

**Purpose:** Displays the present working directory — the directory where the shell is currently operating.

```bash
pwd
```

Example output in a Linux shell:
```text
/home/user/Desktop
```

Example output in Git Bash on Windows:
```text
/c/Users/hp/Desktop
```

The exact path depends on your system and current directory.

**Remember:** `pwd` means **Print Working Directory**.

## 12. `cd` Command

**Purpose:** Changes the current working directory.

### Enter a directory
```bash
cd myfolder
```

### Change to a specified path
```bash
cd /c/Users/hp/Desktop
```

This is an example of a Git Bash path on Windows. Linux paths usually look different, such as `/home/user/Desktop`.

### Go to your home directory
```bash
cd ~
```

The `~` symbol represents the current user's home directory in common Unix-like shells.

## 13. `cd ..` Command

**Purpose:** Moves one level up to the parent directory.

```bash
pwd
cd ..
pwd
```

The first `pwd` displays the current directory, `cd ..` moves to its parent, and the second `pwd` displays the new location.

**Important:** There must be a space between `cd` and `..`.

Other useful navigation commands:
```bash
cd .
cd /
cd -
```

- `cd .` stays in the current directory.
- `cd /` changes to the root directory.
- `cd -` returns to the previous working directory in common shells.

## 14. `ls` Command

**Purpose:** Lists files and directories.

### List the current directory
```bash
ls
```

### Show detailed information
```bash
ls -l
```

The long listing can show permissions, links, owner, group, size, and modification time.

### Show hidden entries
```bash
ls -a
```

Hidden files and directories commonly begin with a dot, such as `.profile`.

### Detailed listing including hidden entries
```bash
ls -la
```

### List a specific directory
```bash
ls helpdir
```

If `helpdir` is a directory, this lists its contents.

### Check specific paths
```bash
ls calendar /bin/perl
```

This asks `ls` to list both paths. If one does not exist, an error is displayed for that path.

| Command | Meaning |
|---|---|
| `ls` | List visible entries |
| `ls -l` | Long listing |
| `ls -a` | Include hidden entries |
| `ls -la` | Long listing including hidden entries |
| `ls directory_name` | List a directory's contents |

## 15. `cal` Command

**Purpose:** Displays a calendar in the terminal. Availability and options depend on the operating system and installed utilities. `cal` may not be installed by default in Git Bash on Windows.

### Current month's calendar
```bash
cal
```

### A specific month and year
```bash
cal 10 2026
```

This requests October 2026 on implementations using the `cal month year` syntax.

### Current year's calendar
```bash
cal -y
```

### Previous, current, and next months
```bash
cal -3
```

This option is supported by many, but not all, implementations.

| Command | Meaning |
|---|---|
| `cal` | Display the current month's calendar |
| `cal 10 2026` | Display October 2026 on compatible implementations |
| `cal -y` | Display the current year's calendar where supported |
| `cal -3` | Display previous, current, and next months where supported |
| `cal -m` | Often selects Monday as the first day of the week; implementation-dependent |
| `cal -s` | Often selects Sunday as the first day of the week; implementation-dependent |

If the terminal prints `command not found`, the utility may be missing or unavailable in that shell.

---

# Part 3: Command Summary

| Command | Main purpose | Example |
|---|---|---|
| `echo` | Display or write text | `echo "Hello"` |
| `cat` | Display or combine file contents | `cat file1.txt` |
| `cp` | Copy files | `cp a.txt b.txt` |
| `mv` | Move or rename files | `mv old.txt new.txt` |
| `rm` | Remove files | `rm a.txt` |
| `rmdir` | Remove an empty directory | `rmdir myfolder` |
| `mkdir` | Create a directory | `mkdir myfolder` |
| `pwd` | Display current directory | `pwd` |
| `cd` | Change directory | `cd myfolder` |
| `cd ..` | Move to parent directory | `cd ..` |
| `ls` | List files and directories | `ls -la` |
| `cal` | Display a calendar, if available | `cal -y` |

---

# Part 4: Practice Exercises

## Exercise 1: Create and display a file
```bash
echo "Hello World" > file1.txt
cat file1.txt
```

Expected output:
```text
Hello World
```

## Exercise 2: Append text
```bash
echo "Good Evening All" >> file1.txt
cat file1.txt
```

The file should now contain:
```text
Hello World
Good Evening All
```

## Exercise 3: Copy, rename, and remove
```bash
echo "Linux practice" > f2.txt
cp f2.txt f3.txt
cat f3.txt
mv f3.txt newfile.txt
cat newfile.txt
rm newfile.txt
```

These commands create a file, copy it, rename the copy, display it, and remove the renamed file. The original `f2.txt` remains.

## Exercise 4: Create and navigate directories
```bash
pwd
mkdir practice
cd practice
pwd
cd ..
ls
```

This displays the current directory, creates `practice`, enters it, confirms the new location, returns to the parent, and lists its entries.

## Exercise 5: Try the calendar command
```bash
cal
cal -y
```

If the command is unavailable, use a Linux environment or install an appropriate calendar utility.

---

# Part 5: Quick Revision Questions

1. What is an operating system?
2. What is the difference between a kernel and a shell?
3. Why was writing UNIX in C useful?
4. What is the purpose of the root directory `/`?
5. What is the difference between `>` and `>>`?
6. Which command displays file contents?
7. What is the difference between `cp` and `mv`?
8. Which command removes an empty directory?
9. What does `mkdir` do?
10. What does `pwd` display?
11. What is the difference between `cd ..` and `cd ~`?
12. What does `ls -la` display?
13. Which command removes a file?
14. What does `cal -y` request on systems that support it?

## Answers

1. System software that manages hardware and provides services for programs.
2. The kernel manages resources; the shell interprets user commands.
3. C improved UNIX's portability and maintainability across hardware platforms.
4. It is the top-level directory in the file-system hierarchy.
5. `>` overwrites; `>>` appends.
6. `cat`.
7. `cp` copies; `mv` moves or renames.
8. `rmdir`.
9. It creates a directory.
10. The current working directory.
11. `cd ..` moves to the parent directory; `cd ~` moves to the home directory.
12. A detailed listing including hidden entries.
13. `rm`.
14. It requests the calendar for the current year.

---

# Final Safety Reminders

- Use `>` carefully because it overwrites file contents.
- Check the destination before using `cp` or `mv`, as existing files may be overwritten.
- Check filenames and paths before using `rm` or `rm -r`.
- Practise file creation and deletion in a dedicated practice directory.
- Commands and options can differ between Linux distributions, UNIX systems, macOS, and Git Bash.
