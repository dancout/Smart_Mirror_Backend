#!/bin/bash
my_addition=$1

env_addition () {
    echo "Adding '$1' to your .env file"
    echo "export $1='Please_Replace_Me_With_Proper_Key'" | sudo tee -a ~/Smart_Mirror_Backend
}

env_addition $my_addition
