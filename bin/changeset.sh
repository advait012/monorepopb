#!/bin/bash
set -e

# source ~/.nvm/nvm.sh

# # Run Node 10
# nvm use v10

# Check and set parameters for changeset
for arg in "$@"
do
    case $arg in
        # to specify the name of the lib to publish
        --libs=*)
            if [[ ! -z "${arg#*=}" ]]; then
                export LIBS="${arg#*=}"
            fi
            shift
        ;;
        # to specify the type of versioning 
        --version=*)
            if [[ ! -z "${arg#*=}" ]]; then
                case ${arg#*=} in
                    "major")
                        versionVal="major"
                    ;;
                    "minor")
                        versionVal="minor"
                    ;;
                    "patch")
                        versionVal="patch"
                    ;;
                    *)
                        echo "Invalid version: ${arg#*=}, Possible values can be one of :[major,minor,patch]"
                        exit 1
                esac
                export VERSIONING="$versionVal"
            fi
            shift
        ;;
        # to specify the number of times a scenario to be retried when failed
        --description=*)
         if [[ ! -z "${arg#*=}" ]]; then
                export DESCRIPTION="${arg#*=}"
            fi
            shift
        ;;

    esac
done


# Make sure the locally installed node executables are available to the script
export PATH=$PATH:./node_modules/.bin

run-func changeset.js createChangeSet

