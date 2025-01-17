#!/bin/sh
# the script below cleans up log.lammps to get thermo out
file0=log.lammps
if test -s $file
then
awk '
/Step/,/Loop/ { print }
' $file0 > x.dat
awk '
!($0 ~ /Step/) { print }
' x.dat > y.dat
awk '
!($0 ~ /Loop/) { print }
' y.dat > thermo.dat
rm x.dat
rm y.dat
echo "Generated thermo.dat"
echo "Done!"
else
echo "where is log.lammps?"
fi
