# UNIX `find`, `touch`, and `ls` Commands

Beginner-friendly notes based on the terminal commands shown in the
screenshots and mentioned in this chat.

## 1. `ls` --- List files and directories

**Purpose:** Displays the files and directories in the current
directory.

**Syntax:**

``` bash
ls
```

**Example:**

``` bash
ls
```

**Output example:**

``` text
pgm1.txt  pgm2.txt
```

This means `pgm1.txt` and `pgm2.txt` are present in the current
directory.

## 2. `find` --- Search for files and directories

The general syntax is:

``` bash
find <starting-location> <condition>
```

Here, `.` means the current directory. The `find` command searches the
starting directory and its subdirectories.

### 2.1 Find files by name

**Command:**

``` bash
find . -name "*.txt"
```

**Purpose:** Finds all entries whose names end in `.txt` in the current
directory and its subdirectories.

**Example output:**

``` text
./pgm1.txt
./pgm2.txt
```

**Explanation:** - `find` --- starts the search. - `.` --- searches from
the current directory. - `-name` --- matches an entry by its name. -
`"*.txt"` --- matches names ending with `.txt`. The quotes prevent the
shell from expanding `*` before `find` receives it.

### 2.2 Find one specific file

**Command:**

``` bash
find . -name "file1.txt"
```

**Purpose:** Searches for an entry named exactly `file1.txt` in the
current directory and all its subdirectories.

**Example output:**

``` text
./file1.txt
```

If the file is inside a subdirectory, the output may look like:

``` text
./dir1/file1.txt
```

### 2.3 Find all directories

**Command:**

``` bash
find . -type d
```

**Purpose:** Displays directories only, starting from the current
directory.

**Example output:**

``` text
.
./dir1
./dir2
./dir2/sub_dir
```

**Explanation:** - `-type` specifies the type of entry to search for. -
`d` means directory. - `.` is also shown because the current directory
is itself a directory.

**Important:** The correct syntax is `find . -type d`, with a space
before `-type`. The form `find .type d` is not the same command.

### 2.4 Find all regular files

**Command:**

``` bash
find . -type f
```

**Purpose:** Displays regular files only. It searches the current
directory and its subdirectories.

**Example output from the screenshots includes:**

``` text
./.bashrc
./.bash_profile
./.inputrc
./p2.sh.swp
./.profile
./.viminfo
./archive.cpio
./dir1/pgm1.txt
./dir1/pgm2.txt
./dir2/archive.cpio
./dir2/file4.txt
```

**Explanation:** - `-type` specifies the entry type. - `f` means regular
file. - Directories are not listed by this condition.

### 2.5 Find files with permission `644`

**Command:**

``` bash
find . -perm 644
```

**Purpose:** Finds entries whose permission bits match `644` exactly.

**Meaning of permission `644`:**

  Digit   Permission   Meaning
  ------- ------------ --------------------------
  `6`     `rw-`        Owner can read and write
  `4`     `r--`        Group can read
  `4`     `r--`        Others can read

So `644` means: - Owner: read and write - Group: read only - Others:
read only

**Example permission display:**

``` text
-rw-r--r--
```

**Note:** `find . -perm 644` asks for an exact permission-bit match. It
does not mean "at least these permissions." On systems that support GNU
`find`, `find . -perm -644` checks that all permission bits in `644` are
present, even if additional permission bits are also set.

## 3. `cd ..` --- Move to the parent directory

**Purpose:** Moves one level up from the current directory to its parent
directory.

**Command:**

``` bash
cd ..
```

**Example:**

If your current directory is:

``` text
/home/student/dir1
```

After running:

``` bash
cd ..
```

Your current directory becomes:

``` text
/home/student
```

The two dots (`..`) represent the parent directory.

## 4. `touch` --- Create files or update timestamps

The `touch` command can create an empty file if it does not exist. If
the file already exists, it updates its timestamps.

### 4.1 Create multiple files

**Command:**

``` bash
touch file2.txt file3.txt file4.txt
```

**Purpose:** Creates three empty files: - `file2.txt` - `file3.txt` -
`file4.txt`

If any of these files already exist, `touch` updates their timestamps
instead of replacing their contents.

### 4.2 Update the access time

**Command:**

``` bash
touch -a file1.txt
```

**Purpose:** Updates the access time (`atime`) of `file1.txt`.

The access time records when a file was last accessed/read, subject to
the filesystem's timestamp settings.

### 4.3 Update the modification time

**Command:**

``` bash
touch -m file1.txt
```

**Purpose:** Updates the modification time (`mtime`) of `file1.txt`.

The modification time records when the file's contents were last
modified. This command changes the timestamp; it does not edit the
file's contents.

## 5. `ls -l` --- Display detailed file information

**Command:**

``` bash
ls -l
```

**Purpose:** Displays files and directories in long-listing format.

Example:

``` text
-rw-r--r-- 1 student group 0 Nov 13 18:51 archive.cpio
drwxr-xr-x 2 student group 0 Nov 13 18:13 dir1
lrwxrwxrwx 1 student group 7 Nov 9 10:50 file1.txt -> ff1.txt
```

**Meaning of the columns:**

  -----------------------------------------------------------------------
  Part                                Meaning
  ----------------------------------- -----------------------------------
  First characters                    File type and permissions

  Link count                          Number of hard links (for
                                      directories, the count has
                                      directory-specific meaning)

  Next value                          Owner

  Next value                          Group

  Number                              Size in bytes

  Date and time                       Last modification time

  Final value                         File or directory name
  -----------------------------------------------------------------------

### Understanding the first characters

  Starting character   Meaning
  -------------------- ---------------
  `-`                  Regular file
  `d`                  Directory
  `l`                  Symbolic link

For example:

``` text
-rw-r--r--
```

means a regular file where the owner can read/write and the group and
others can read.

A line such as:

``` text
file1.txt -> ff1.txt
```

indicates that `file1.txt` is a symbolic link pointing to `ff1.txt`.

## 6. Quick revision table

  ---------------------------------------------------------------------------
  Command                                 Use
  --------------------------------------- -----------------------------------
  `ls`                                    List files and directories

  `find . -name "*.txt"`                  Find entries whose names end in
                                          `.txt`

  `find . -name "file1.txt"`              Find an entry named `file1.txt`

  `find . -type d`                        Find directories

  `find . -type f`                        Find regular files

  `find . -perm 644`                      Find entries with exactly
                                          permission bits `644`

  `cd ..`                                 Move to the parent directory

  `touch file2.txt file3.txt file4.txt`   Create the files if they do not
                                          exist; otherwise update timestamps

  `touch -a file1.txt`                    Update access time

  `touch -m file1.txt`                    Update modification time

  `ls -l`                                 Show detailed file information
  ---------------------------------------------------------------------------

## 7. Practice commands

Try these commands one by one in your terminal:

``` bash
ls
find . -name "*.txt"
find . -name "file1.txt"
find . -type d
find . -type f
find . -perm 644
cd ..
touch file2.txt file3.txt file4.txt
touch -a file1.txt
touch -m file1.txt
ls -l
```

**Remember:** - `.` means current directory. - `..` means parent
directory. - `-name` searches by name. - `-type d` searches for
directories. - `-type f` searches for regular files. - `-perm` searches
by permission bits. - `touch -a` updates access time. - `touch -m`
updates modification time.
