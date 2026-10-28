# Basic Linux Commands

## 1. `echo` Command

**Purpose:** Displays text in the terminal or writes text into a file.

**Syntax:**
```bash
echo "text"
echo "text" > filename.txt
```

**Examples:**

```bash
echo "Hello World"
```
Output:
```text
Hello World
```

Write text into a file:
```bash
echo "Hello World" > file1.txt
```

Append text to an existing file:
```bash
echo "Good Evening All" >> file1.txt
```

**Explanation:**
- `echo` displays text on the terminal.
- `>` creates a file if it does not exist and overwrites its contents if it does.
- `>>` appends text to the end of a file without deleting existing content.

---

## 2. `cat` Command

**Purpose:** Displays file contents, creates files with redirected input, or combines files.

**Syntax:**
```bash
cat filename.txt
cat > filename.txt
```

**Examples:**

Display file contents:
```bash
cat file1.txt
```

Create a file and enter text:
```bash
cat > file1.txt
```

Type the text:
```text
Hello World
```

Press `Ctrl + D` to finish entering text and save the input.

Combine and display two files:
```bash
cat file1.txt file2.txt
```

**Explanation:**
- `cat filename.txt` displays the contents of a file.
- `cat > filename.txt` accepts keyboard input and writes it to the file.
- `cat` by itself reads from standard input until you end the input with `Ctrl + D`.
- Using `>` overwrites an existing file.

---

## 3. `cp` Command

**Purpose:** Copies files or directories.

**Syntax:**
```bash
cp source destination
```

**Example:**
```bash
cp f2.txt f3.txt
```

**Explanation:**
- `f2.txt` is the source file.
- `f3.txt` is the destination file.
- If `f3.txt` does not exist, it is created with the contents of `f2.txt`.
- If `f3.txt` already exists, its contents are overwritten.

**Verify the copied file:**
```bash
cat f3.txt
```

---

## 4. `mv` Command

**Purpose:** Moves a file to another location or renames a file.

**Syntax:**
```bash
mv source destination
```

**Example — Rename a file:**
```bash
mv file1.txt file2.txt
```

**Example — Move a file into a directory:**
```bash
mv file1.txt documents/
```

**Explanation:**
- `mv file1.txt file2.txt` renames `file1.txt` to `file2.txt` if the destination does not exist.
- `mv file1.txt documents/` moves the file into the `documents` directory.
- If the destination is an existing file, its contents can be overwritten.

---

## 5. `rm` Command

**Purpose:** Deletes files and directories.

**Syntax:**
```bash
rm filename.txt
```

**Example — Delete a file:**
```bash
rm file1.txt
```

**Example — Delete multiple files:**
```bash
rm file1.txt file2.txt
```

**Example — Delete an empty directory:**
```bash
rmdir documents
```

**Explanation:**
- `rm filename.txt` removes the specified file.
- `rm` generally does not move files to the Recycle Bin, so deletion may be difficult to reverse.
- `rmdir` removes an empty directory.
- Use `rm -r directory_name` to delete a directory and its contents, with caution.

---

## Summary Table

| Command | Purpose |
|---|---|
| `echo` | Display or write text |
| `cat` | Display or enter file contents |
| `cp` | Copy files |
| `mv` | Move or rename files |
| `rm` | Delete files |
| `rmdir` | Remove empty directories |

## Practice Commands

```bash
touch file1.txt
echo "Hello World" > file1.txt
cat file1.txt

echo "Good Evening All" > f2.txt
cp f2.txt f3.txt
cat f3.txt

mv f3.txt newfile.txt
cat newfile.txt

rm newfile.txt
```

**Note:** These commands work in Git Bash, Linux, and other Unix-like shells. Be careful with `>` because it overwrites existing file contents.