echo "******************************************************************************"
echo "Install OS Packages." `date`
echo "******************************************************************************"
dnf install -y unzip tar gzip shadow-utils
dnf install -y oracle-database-preinstall-21c
dnf update -y

