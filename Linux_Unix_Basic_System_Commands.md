
# Linux / Unix Commands – Complete Notes

## 1. who Command

**Description:** Displays information about users currently logged into the system.

### Syntax
```bash
who [options]
```

### Options

| Option | Description |
|---|---|
| `-a` | Display all available information |
| `-b` | Display the last system boot time |
| `-d` | Display dead processes |
| `-H` | Display column headings |
| `-l` | Display login processes |
| `-m` | Display information about the current terminal |
| `-p` | Display active processes |
| `-q` | Display logged-in usernames and total count |
| `-r` | Display current runlevel |
| `-s` | Display short listing |
| `-t` | Display last system clock change |
| `-T` | Display terminal message status |
| `-u` | Display idle time and process ID |
| `--help` | Display help |
| `--version` | Display version |

### Examples
```bash
who
who -a
who -b
who -H
who -q
who am i
```

---

## 2. clear Command

**Description:** Clears the terminal screen without deleting command history or files.

### Syntax
```bash
clear [options]
```

### Options

| Option | Description |
|---|---|
| `-T TERM` | Specify terminal type |
| `-x` | Do not clear the scrollback buffer |
| `-V` | Display version |
| `-h` | Display help |

### Examples
```bash
clear
clear -x
clear -V
```

---

## 3. tty Command

**Description:** Displays the filename of the terminal connected to standard input.

### Syntax
```bash
tty [options]
```

### Options

| Option | Description |
|---|---|
| `-s` | Silent mode; display no output |
| `--help` | Display help |
| `--version` | Display version |

### Examples
```bash
tty
tty -s
```

**Example Output:**
```text
/dev/pts/0
```

---

## 4. which Command

**Description:** Locates the executable file of a command by searching directories in the PATH environment variable.

### Syntax
```bash
which [options] command
```

### Options

| Option | Description |
|---|---|
| `-a` | Display all matching executable paths |
| `--skip-alias` | Ignore aliases |
| `--skip-functions` | Ignore shell functions |
| `--skip-dot` | Ignore current directory |
| `--read-alias` | Read aliases from standard input |
| `--read-functions` | Read functions from standard input |
| `--show-tilde` | Display home directory using tilde |
| `--show-dot` | Display current directory as `./` |
| `--help` | Display help, if supported |
| `--version` | Display version, if supported |

### Examples
```bash
which ls
which gcc
which python
which -a python
```

**Note:** Options vary between implementations. `which` may not identify shell built-ins reliably.

---

## 5. ls Command

**Description:** Lists files and directories in the current or specified directory.

### Syntax
```bash
ls [options] [directory]
```

### Options

| Option | Description |
|---|---|
| `-1` | Display one entry per line |
| `-l` | Display detailed information |
| `-a` | Display all files including hidden files |
| `-A` | Display hidden files except `.` and `..` |
| `-h` | Display file sizes in human-readable format |
| `-R` | List directories recursively |
| `-r` | Reverse sorting order |
| `-t` | Sort by modification time |
| `-S` | Sort by file size |
| `-i` | Display inode number |
| `-d` | Display directory itself |
| `-F` | Append indicators to file names |
| `-p` | Append `/` to directory names |
| `-n` | Display numeric user and group IDs |
| `-s` | Display allocated size |
| `-X` | Sort by file extension |
| `-m` | Display entries separated by commas |
| `-C` | Display entries in columns |
| `-Q` | Enclose filenames in double quotes |
| `-U` | Do not sort entries |
| `--color` | Display colored output |
| `--full-time` | Display complete date and time |
| `--help` | Display help |
| `--version` | Display version |

### Important Examples

```bash
ls
ls -1
ls -l
ls -a
ls -A
ls -la
ls -lh
ls -ltr
ls -R
ls -i
ls -ld /tmp
```

### Difference Between ls, ls -1 and ls -l

| Command | Description |
|---|---|
| `ls` | Displays files in columns |
| `ls -1` | Displays one file per line |
| `ls -l` | Displays detailed file information |

---

## 6. type Command

**Description:** Identifies how the shell interprets a command, such as an alias, keyword, function, built-in or executable file.

### Syntax
```bash
type [options] command
```

### Options

| Option | Description |
|---|---|
| `-a` | Display all locations and definitions |
| `-t` | Display only the command type |
| `-p` | Display executable file path |
| `-P` | Search PATH for an executable |
| `-f` | Suppress function lookup |
| `-T` | Display type information in a scripting-friendly form |

### Examples
```bash
type ls
type cd
type -a echo
type -t pwd
type -P python
```

**Note:** `type` is a Bash shell built-in.

---

## 7. while Loop

**Description:** The while loop repeatedly executes a group of commands as long as the condition is true.

### Syntax
```bash
while [ condition ]
do
    commands
done
```

### Example 1: Print numbers from 1 to 5

```bash
i=1

while [ $i -le 5 ]
do
    echo $i
    i=$((i + 1))
done
```

**Output:**
```text
1
2
3
4
5
```

### Example 2: Print a message three times

```bash
i=1

while [ $i -le 3 ]
do
    echo "Hello Linux"
    i=$((i + 1))
done
```

### Example 3: Infinite Loop

```bash
while true
do
    echo "Running"
done
```

Press `Ctrl + C` to stop the loop.

### Related Statements

| Statement | Description |
|---|---|
| `do` | Starts the loop body |
| `done` | Ends the loop |
| `break` | Terminates the loop |
| `continue` | Skips the current iteration |
| `until` | Repeats until the condition becomes true |

---

## 8. cat Command

**Description:** Displays file contents, combines files and reads input from the keyboard.

### Syntax
```bash
cat [options] [filename]
```

### Options

| Option | Description |
|---|---|
| `-n` | Number all lines |
| `-b` | Number non-empty lines |
| `-s` | Remove repeated blank lines from output |
| `-E` | Display `$` at the end of each line |
| `-T` | Display tab characters as `^I` |
| `-v` | Display non-printing characters visibly |
| `-A` | Display all non-printing characters |
| `-e` | Equivalent to `-vE` |
| `-t` | Equivalent to `-vT` |
| `--help` | Display help |
| `--version` | Display version |

### Examples
```bash
cat file.txt
cat -n file.txt
cat -b file.txt
cat -s file.txt
cat -A file.txt
cat file1.txt file2.txt
```

### Creating a File

```bash
cat > newfile.txt
```

Type the content and press `Ctrl + D` to save and exit.

### Combining Files

```bash
cat file1.txt file2.txt > combined.txt
```

---

## 9. pwd Command

**Description:** Displays the present working directory (the current directory path).

### Syntax
```bash
pwd [options]
```

### Options

| Option | Description |
|---|---|
| `-L` | Display logical directory path |
| `-P` | Display physical directory path |
| `--help` | Display help (external GNU version) |
| `--version` | Display version (external GNU version) |

### Examples
```bash
pwd
pwd -L
pwd -P
```

**Example Output:**
```text
/home/user/Documents
```

---

## 10. date Command

**Description:** Displays the current system date and time. It can also format dates and times.

### Syntax
```bash
date [options] [+FORMAT]
```

### Options

| Option | Description |
|---|---|
| `-d` | Display a specified date |
| `-f` | Read dates from a file |
| `-I` | Display date in ISO format |
| `-R` | Display date in RFC format |
| `-r` | Display file modification time |
| `-u` | Display UTC time |
| `--debug` | Show date parsing information |
| `--help` | Display help |
| `--version` | Display version |

### Format Specifiers

| Format | Description |
|---|---|
| `%d` | Day |
| `%m` | Month |
| `%Y` | Four-digit year |
| `%y` | Two-digit year |
| `%A` | Full weekday name |
| `%a` | Short weekday name |
| `%B` | Full month name |
| `%b` | Short month name |
| `%H` | Hour in 24-hour format |
| `%I` | Hour in 12-hour format |
| `%M` | Minutes |
| `%S` | Seconds |
| `%p` | AM/PM |
| `%F` | Date in YYYY-MM-DD format |
| `%T` | Time in HH:MM:SS format |
| `%j` | Day of the year |
| `%Z` | Time zone |

### Examples
```bash
date
date "+%d-%m-%Y"
date "+%A"
date "+%H:%M:%S"
date "+%d/%m/%Y"
date -u
date -d "tomorrow"
date -d "yesterday"
date -I
date -r file.txt
```

---

## 11. wc Command

**Description:** Counts lines, words, bytes and characters in a file.

### Syntax
```bash
wc [options] [filename]
```

### Options

| Option | Description |
|---|---|
| `-l` | Count lines |
| `-w` | Count words |
| `-c` | Count bytes |
| `-m` | Count characters |
| `-L` | Display maximum line length |
| `--help` | Display help |
| `--version` | Display version |

### Examples
```bash
wc file.txt
wc -l file.txt
wc -w file.txt
wc -c file.txt
wc -m file.txt
wc -L file.txt
```

### Example Output
```text
5  20  120  file.txt
```

The values represent:
- 5 lines
- 20 words
- 120 bytes

---

## 12. od Command

**Description:** Displays file contents in different numerical formats such as octal, decimal and hexadecimal.

### Syntax
```bash
od [options] [filename]
```

### Options

| Option | Description |
|---|---|
| `-a` | Display named characters |
| `-b` | Display bytes in octal |
| `-c` | Display characters |
| `-d` | Display unsigned decimal values |
| `-f` | Display floating-point values |
| `-i` | Display decimal integers |
| `-o` | Display octal values |
| `-x` | Display hexadecimal values |
| `-A` | Specify address format |
| `-t` | Specify output data type |
| `-j` | Skip specified bytes |
| `-N` | Limit number of bytes displayed |
| `-S` | Display printable strings |
| `-w` | Specify output width |
| `--help` | Display help |
| `--version` | Display version |

### Examples
```bash
od file.txt
od -c file.txt
od -b file.txt
od -x file.txt
od -A x -t x1 file.txt
od -N 16 -t x1 file.txt
```

---

## 13. script Command

**Description:** Records all terminal activities, including commands and their output, into a file.

### Syntax
```bash
script [options] [filename]
```

### Options

| Option | Description |
|---|---|
| `-a` | Append output to an existing file |
| `-c` | Run a specified command |
| `-e` | Return child process exit status |
| `-f` | Flush output after each write |
| `-q` | Run in quiet mode |
| `-t` | Save timing information |
| `-T` | Log timing information (version-dependent) |
| `-O` | Save terminal output to a file |
| `-I` | Save terminal input to a file |
| `-B` | Save input and output to a file |
| `-E` | Control input echo |
| `-h` | Display help |
| `-V` | Display version |

### Examples

**Start recording:**
```bash
script
```

**Record in a specified file:**
```bash
script session.txt
```

**Append to an existing file:**
```bash
script -a session.txt
```

**Run a command and record it:**
```bash
script -c "ls -l" output.txt
```

**Stop recording:**
```bash
exit
```

You can also press `Ctrl + D`.

---

# Quick Revision Table

| Command | Purpose |
|---|---|
| `who` | Display logged-in users |
| `clear` | Clear terminal screen |
| `tty` | Display terminal name |
| `which` | Locate executable commands |
| `ls` | List files and directories |
| `type` | Identify command type |
| `while` | Execute commands repeatedly |
| `cat` | Display and combine files |
| `pwd` | Display current directory |
| `date` | Display date and time |
| `wc` | Count lines, words and characters |
| `od` | Display data in octal and other formats |
| `script` | Record terminal activities |

---

# Useful Help Commands

Use these commands to learn more about Linux commands:

```bash
command --help
man command
info command
```

### Examples
```bash
ls --help
man ls
man date
man script
```

For Bash built-in commands and keywords:

```bash
help type
help pwd
help while
```

**Note:** Some options differ between GNU/Linux distributions and Unix systems. Check `man command` on your own system for the exact available options.
