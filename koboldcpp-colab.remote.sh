sudo apt  install clang wget git cmake -y
wget https://github.com/LostRuins/koboldcpp/archive/refs/tags/v1.34.2.zip
unzip v1.34.2.zip
mv koboldcpp-1.34.2 koboldcpp
cd koboldcpp
mkdir build
cd build
cmake ..
make
cd ..
cmake
make
echo "This is the help and contain the params:"
python koboldcpp.py --help
