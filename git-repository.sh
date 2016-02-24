#!/bin/bash

echo "create git repository"

repository=$1

if [ $# -gt 0 ] && [ !"$repository" ] ;
then

BASEDIR="`pwd`"
TARGET_PATH="/home/git"
HOST="ssh.haimingli.me"

repository="$repository.git"
CREATE_GIT_REPOSITORY_CMD="sudo -u git git --bare $repository"

#echo $CREATE_GIT_REPOSITORY_CMD

eval "$CREATE_GIT_REPOSITORY_CMD"


REPOSITORY_PATH="$BASEDIR/$repository"

echo "The $repository has been created in $REPOSITORY_PATH"

TARGET_PATH="$TARGET_PATH/$repository"
LN_TO_GIT_HOME="sudo -u git ln -s $REPOSITORY_PATH $TARGET_PATH"

#echo $LN_TO_GIT_HOME

eval "$LN_TO_GIT_HOME"
echo "The $REPOSITORY_PATH has been linked to $TARGET_PATH , So you can checkout with git@$HOST:git/$repository"

else

echo 'please enter your repository name'

fi
