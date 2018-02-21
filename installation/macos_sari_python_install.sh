#!/bin/sh

echo "Beginning installation process..."

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Found MacOS operating system"
  conda_installer = Miniconda3-latest-MacOSX-x86_64.sh

  if [ ! -f "$conda_installer" ]; then
    rm -f Miniconda3-latest-MacOSX-x86_64.sh
  fi

  wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
  chmod +x Miniconda3-latest-MacOSX-x86_64.sh
  sudo ./Miniconda3-latest-MacOSX-x86_64.sh

else
  echo "THIS SCRIPT IS FOR MACOS OPERATING SYSTEMS"
  echo "THE CURRENT OS NOT SUPPORTED FOR THIS SCRIPT"
  echo "EXISTING SYSTEM..."
  exit

fi

echo "Reloading Python paths..."
. ~/.bash_profile

echo "Installing Python packages"
conda config --add channels conda-forge
conda install numpy
conda install matplotlib
conda install jupyter
conda install pandas
conda install folium
conda install rasterio
conda install geopandas
conda install rasterstats

echo "Installation completed successfully!\n"

exit
