# UNIX/Linux Commands – Clean Practical Record

**Environment:** MSYS2 UCRT64 terminal on Windows  
**Note:** The original terminal recording contained typing mistakes, interrupted commands, and terminal control characters. This version keeps the useful commands and presents them in a clean order. The sample files are created below so the commands have consistent, reproducible output.

---

## 1. `pwd` – Display the current directory

**Command**
```bash
pwd
```

**Example output**
```text
/home/hp
```

## 2. `ls` – List files and directories

**Command**
```bash
ls
```

**Example output**
```text
exp.txt  name.txt  users.txt
```

## 3. `mkdir` – Create a directory

**Command**
```bash
mkdir dir
```

**Output**
```text
(no output; the directory is created)
```

To check:
```bash
ls
```

**Example output**
```text
dir  exp.txt  name.txt  users.txt
```

## 4. `echo` – Display text or write text to a file

**Command**
```bash
echo "hello i am damini" > exp.txt
```

**Output**
```text
(no output; the text is written to exp.txt)
```

## 5. `cat` – Display file contents

**Command**
```bash
cat exp.txt
```

**Output**
```text
hello i am damini
```

## 6. `grep` – Search for text in a file

First, create a sample file:
```bash
printf "damini\nshreya\nsai\nshreyash\nshey\nshriya\n" > name.txt
```

Search for lines containing `shre`:
```bash
grep "shre" name.txt
```

**Output**
```text
shreya
shreyash
```

Search without case sensitivity:
```bash
grep -i "SH" name.txt
```

**Output**
```text
shreya
shreyash
shey
shriya
```

## 7. `sed` – Find and replace text

Create a sample file:
```bash
printf "service is running\nservice stopped\nservice restarted\n" > s1.txt
```

Replace `service` with `server`:
```bash
sed 's/service/server/g' s1.txt
```

**Output**
```text
server is running
server stopped
server restarted
```

The command above displays the changed text without modifying the original file.

To save the changes in the same file:
```bash
sed -i 's/service/server/g' s1.txt
```

## 8. `cut` – Extract selected fields from a file

Create a colon-separated file:
```bash
printf "john:engineer:newyork\nalice:manager:london\nbob:developer:tokyo\n" > users.txt
```

Display only the first field:
```bash
cut -d ':' -f 1 users.txt
```

**Output**
```text
john
alice
bob
```

Display the first and second fields:
```bash
cut -d ':' -f 1,2 users.txt
```

**Output**
```text
john:engineer
alice:manager
bob:developer
```

## 9. `paste` – Combine lines from two files

Create the first file:
```bash
printf "Alice\nBob\nCharlie\n" > employees.txt
```

Create the second file:
```bash
printf "Developers\nDesigner\nManager\n" > roles.txt
```

Combine corresponding lines using `:` as the delimiter:
```bash
paste -d ':' employees.txt roles.txt
```

**Output**
```text
Alice:Developers
Bob:Designer
Charlie:Manager
```

Combine all lines from each file into a single line:
```bash
paste -s employees.txt roles.txt
```

**Example output** (tabs separate the values):
```text
Alice    Bob    Charlie
Developers    Designer    Manager
```

## 10. `ls -l` – Display detailed file information

**Command**
```bash
ls -l
```

**Example output**
```text
-rw-r--r-- 1 hp None 18 Nov  7 18:15 exp.txt
-rw-r--r-- 1 hp None 40 Nov  7 18:16 name.txt
-rw-r--r-- 1 hp None 64 Nov  7 18:31 users.txt
```

The exact owner, size, and date depend on your computer.

## 11. `chmod` – Change file permissions

Create a file:
```bash
echo "Hello" > f1.txt
```

View its permissions:
```bash
ls -l f1.txt
```

**Example output**
```text
-rw-r--r-- 1 hp None 6 Nov  7 19:08 f1.txt
```

Remove all permissions for user, group, and others:
```bash
chmod ugo-rwx f1.txt
```

Check the permissions:
```bash
ls -l f1.txt
```

**Output observed in the supplied terminal recording**
```text
-r--r--r-- 1 hp None 6 Nov  7 19:08 f1.txt
```

Set permissions to `755`:
```bash
chmod 755 f1.txt
```

On a normal Linux filesystem, check with:
```bash
ls -l f1.txt
```

**Expected Linux output**
```text
-rwxr-xr-x 1 user group 6 date f1.txt
```

**Important environment note:** In the supplied MSYS2 UCRT64 recording, `chmod 755 f1.txt` was followed by an `ls -l` result of `-rw-r--r--`, rather than the expected Linux permission string. Windows filesystem/permission configuration can affect how MSYS2 represents Unix permissions. Do not copy the expected Linux output as if it were the output observed on that Windows machine.

### Common permission values

| Command | Meaning |
|---|---|
| `chmod +x file.sh` | Add execute permission |
| `chmod u+x file.sh` | Add execute permission for the owner |
| `chmod 644 file.txt` | Owner can read/write; group and others can read |
| `chmod 755 file.sh` | Owner can read/write/execute; group and others can read/execute |
| `chmod 777 file` | Give read/write/execute permissions to everyone (generally avoid unless necessary) |

## 12. `umask` – Display the default permission mask

**Command**
```bash
umask
```

**Output observed in the supplied terminal recording**
```text
0022
```

---

## Quick revision

| Command | Purpose |
|---|---|
| `pwd` | Show current directory |
| `ls` | List files and directories |
| `mkdir` | Create a directory |
| `echo` | Display or write text |
| `cat` | Display file contents |
| `grep` | Search for matching text |
| `sed` | Find and replace text |
| `cut` | Extract fields |
| `paste` | Merge corresponding lines |
| `ls -l` | Show detailed file permissions and information |
| `chmod` | Change file permissions |
| `umask` | Display the default permission mask |
| `clear` | Clear the terminal screen |
| `exit` | Close the terminal session |
