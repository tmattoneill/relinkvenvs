#!/bin/bash

# Script to simplify updating python virtualenv links after a python update.
# Matt O'Neill 2019-04-06 v. 0.1
#
# Ideas for improvement:
# add options for:
#  - (-v)irtual environment directory to relink into (e.g. venv v. .virtualenvs)
#  - relink (-a)ll virtual environemnts (add in interactive prompting)
#  - (-c)hange to virtual environment upon completion; conflicts with "all" option
# error checking for:
#  - does the virtual environment exist?
#  - conflicting user options

if [ $# = 0 ]
then
	echo "Usage: venvrelink.sh [options] environment name [additional environments]"
	echo "Exiting..."
	return 1
fi

myenv=$1

echo "Relinking python bin for: $myenv."

find ~/.virtualenvs/$myenv/ -type l

relink="y"
echo "Relink the following files [Y] / N: "
read -r relink

if [ $relink = "Y" ] || [ $relink = "y" ]
then
	find ~/.virtualenvs/$myenv/ -type l -delete
	virtualenv ~/.virtualenvs/$myenv
else
	echo "Aborting..."
fi
