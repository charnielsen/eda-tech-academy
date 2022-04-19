#!/bin/zsh

originPrefix="std-2"

echo "Updating prefix to " $PREFIX

contains() {
    string="$1"
    substring="$2"
    test -n "$string" || test -z "$substring" && test -z "${string##*"$substring"*}"
}

for f in $(ls -R **/*.yaml)
do 
    if contains $f  "kustomization.yaml"
    then
        echo "Skip $f"
    else  
        sed -i ''  "s/$originPrefix/$PREFIX/g" $f
    fi
done 
