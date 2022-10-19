# Utility for backup

You can create a backup of you file or directory. This awesome utility is written in bash!

## Installation

You can install repository and run a file **backup.sh**

```sh
git clone https://github.com/name/repository.git 
```

```sh
chmod +x bash.sh
./bash.sh --help
```

## Global use in GNU/Linux

You can use this script with all users and on all locations! You just have to follow this guide.

Change name of the file

```sh
# Enter the directory containing the file and rename it's
mv backup.sh backup 
```

Move the file in /usr/local/bin/

```sh
mv backup /usr/local/bin/
```

Change owner of the file

```sh
chown your_user:your_user backup 
```
