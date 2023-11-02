# Custom Man Page Installation

This guide explains how to install and use a custom man page on your system.

## Installation

To make your custom man page available, you need to follow these steps:

1. Place the generated man page file in the appropriate directory where man pages are stored. The standard location is `/usr/local/share/man/man1/` for user-specific pages. You may need root or superuser permissions to install it system-wide.

    ```bash
    mkdir -p /usr/local/share/man/man1/
    mv internsctl.1 /usr/local/share/man/man1/
    ```

2. After moving the file, update the Man Database to ensure that your custom man page is recognized by the `man` command:

    ```bash
    mandb
    ```

## Viewing Your Manual Page

You can now view your custom man page using the `man` command:

```bash
man internsctl
