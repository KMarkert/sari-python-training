#!/bin/sh

echo "Beginning installation process..."

conda_installer = Miniconda3-latest-Linux-x86_64.sh

if [ ! -f "$conda_installer" ]; then
  rm -f Miniconda3-latest-Linux-x86_64.sh
fi

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x ./Miniconda3-latest-Linux-x86_64.sh
sudo ./Miniconda3-latest-Linux-x86_64.sh


echo "Fixing Python paths..."
. ~/.bashrc

echo "Installing Python packages"
sudo ~/miniconda3/bin/conda config --add channels conda-forge
sudo ~/miniconda3/bin/conda install numpy
sudo ~/miniconda3/bin/conda install matplotlib
sudo ~/miniconda3/bin/conda install jupyter
sudo ~/miniconda3/bin/conda install pandas
sudo ~/miniconda3/bin/conda install folium
sudo ~/miniconda3/bin/conda install rasterio
sudo ~/miniconda3/bin/conda install geopandas
sudo ~/miniconda3/bin/conda install rasterstats

echo "Installation completed successfully!\n"

exit
