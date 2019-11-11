# This command can be run from the terminal to run this file
#  bash -c "$(curl -sL https://raw.githubusercontent.com/dancout/Smart_Mirror_Backend/master/scripts/pull_project.sh)"

echo "Cloning Smart_Mirror_Backend"
git clone https://github.com/dancout/Smart_Mirror_Backend.git

echo "Now running installers & program"
cd Smart_Mirror_Backend/scripts
bash install.sh