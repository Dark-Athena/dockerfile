echo "******************************************************************************"
echo "Install OS Packages." `date`
echo "******************************************************************************"
dnf install -y unzip tar gzip shadow-utils
dnf install -y perl perl-devel
dnf install -y oracle-database-preinstall-19c
dnf update -y
rm -Rf /var/cache/yum
rm -Rf /var/cache/dnf
