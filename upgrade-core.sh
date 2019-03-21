#!/bin/bash
clear
echo "----------------------------------------------|"
echo "|  This script if to update core drupal       |"
echo "----------------------------------------------|"
read -p "Press enter to continue"

# list all directories
echo "Your repositories are next:"
for d in */ ; do
    echo "$d"
done

#get name of project
echo "|--------------------------------------------|"
echo "|   Select project to upgrade core drupal    |"
echo "|--------------------------------------------|"
read repository

#get  new core version
echo "|----------------------------------------------|"
echo "| Please insert the new core version correctly |"
echo "|   example 'drupal-8.7.0-alpha2.tar.gz'       |"
echo "|----------------------------------------------|"
read core

# Check will enter here if $DIRECTORY exists.
if [ -d "$repository" ]; then
  cd $repository/www    
  namefile="drupal-core"  
  curl -o ./"$namefile".tar.gz "https://ftp.drupal.org/files/projects/"$core".tar.gz"            
  tar -xvzf "$namefile".tar.gz  
  cp -R ./"$core"/. drupal8/  
  rm -r "$namefile".tar.gz
  rm -r "$core"
  clear
  echo "|------------------------------------------------"  
  echo "|  The update is finally, please run update.php |"
  echo "|------------------------------------------------"
  read -p "Press enter to continue"  
else
  echo "The repository not exist, please run other time ./init.sh"
fi