# This patch script should only be used for a clean installation.
# It doesn't patch existing databases.
echo "******************************************************************************"
echo "Patch Oracle Software." `date`
echo "******************************************************************************"
 
# Adjust to suit your patch level.
export PATH=${ORACLE_HOME}/OPatch:${PATH}
export OPATCH_FILE="p6880880_190000_Linux-x86-64.zip"
export PATCH_FILE1="p33192694_190000_Linux-x86-64.zip"
export PATCH_FILE2="p33192793_190000_Linux-x86-64.zip"
export PATCH_TOP=${SOFTWARE_DIR}/PATCH_TOP
export PATCH_PATH1=${PATCH_TOP}/33192694
export PATCH_PATH2=${PATCH_TOP}/33192793

mkdir ${SOFTWARE_DIR}/PATCH_TOP
echo "******************************************************************************"
echo "Prepare opatch." `date`
echo "******************************************************************************"

cd ${ORACLE_HOME}
unzip -oq ${SOFTWARE_DIR}/${OPATCH_FILE}

echo "******************************************************************************"
echo "Unzip software." `date`
echo "******************************************************************************"

cd ${SOFTWARE_DIR}/PATCH_TOP
unzip -oq ${SOFTWARE_DIR}/${PATCH_FILE1}
unzip -oq ${SOFTWARE_DIR}/${PATCH_FILE2}

echo "******************************************************************************"
echo "Apply patches." `date`
echo "******************************************************************************"

cd ${PATCH_PATH1}
opatch prereq CheckConflictAgainstOHWithDetail -ph ./
opatch apply -silent

cd ${PATCH_PATH2}
opatch prereq CheckConflictAgainstOHWithDetail -ph ./
opatch apply -silent

#opatch util cleanup -silent

rm -Rf ${PATCH_TOP}
rm -f ${SOFTWARE_DIR}/${OPATCH_FILE}
rm -f ${SOFTWARE_DIR}/${PATCH_FILE1}
rm -f ${SOFTWARE_DIR}/${PATCH_FILE2}
