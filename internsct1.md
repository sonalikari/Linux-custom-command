# internsctl(1) - Custom Linux Command

## SYNOPSIS

**internsctl** [**command**] [**options**]

## DESCRIPTION

The `internsctl` command is a custom Linux command that provides various functionalities for system management.

## COMMANDS

- **cpu getinfo**:
  Get CPU information similar to the `lscpu` command.

- **memory getinfo**:
  Get Memory information similar to the `free` command.

- **user create <username>**:
  Create a new user who can log in to the Linux system and access their home directory.

- **user list**:
  List all regular users on the server.

- **user list --sudo-only**:
  List all users with sudo permissions on the server.

- **file getinfo [options] <file-name>**:
  Get information about a file, with optional specific information.

- **lscpu**:
  Display information about the CPU.

- **free**:
  Display amount of free and used memory in the system.


## OPTIONS

- **--size, -s**:
  Print the size of the specified file.

- **--permissions, -p**:
  Print the file permissions.

- **--owner, -o**:
  Print the file owner.

- **--last-modified, -m**:
  Print the last modified time of the specified file.

## EXAMPLES

```sh
$ internsctl cpu getinfo
$ internsctl memory getinfo
$ internsctl user create myuser
$ internsctl user list
$ internsctl user list --sudo-only
$ internsctl file getinfo /path/to/myfile.txt
$ internsctl file getinfo --size /path/to/myfile.txt
% internsct1 free
