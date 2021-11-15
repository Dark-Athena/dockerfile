echo "******************************************************************************"
echo "Install oml4py server." `date`
echo "******************************************************************************"
dnf install libffi-devel -y
dnf install openssl-devel -y
dnf install tk-devel -y
dnf install xz-devel -y
dnf install zlib-devel -y
dnf install gcc-c++ -y
export PYTHONHOME=/opt/python3
export PATH=$PYTHONHOME/bin:$PATH
export LD_LIBRARY_PATH=$PYTHONHOME/lib:$LD_LIBRARY_PATH
./configure --enable-shared --prefix=$PYTHONHOME
make clean; make
make altinstall
rm -Rf /var/cache/yum
rm -Rf /var/cache/dnf
cd $PYTHONHOME/bin
ln -s python3.9 python3
echo "$PYTHONHOME/lib" > /etc/ld.so.conf.d/python3.conf
ldconfig
pip3.9 config set global.index-url $PIP_SOURCE
pip3.9 install --upgrade pip
pip3.9 install wheel
pip3.9 install numpy==1.18.1
pip3.9 install scipy==1.6.0
pip3.9 install cx_Oracle==8.1.0
pip3.9 install pandas==0.25.3
pip3.9 install matplotlib==3.1.2
pip3.9 install scikit-learn==0.23.1
rm -rf ~/.cache/pip
