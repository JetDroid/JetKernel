#/bin/bash

mkdir arch/arm/boot/tmp
mkdir arch/arm/boot/tmp/system
mkdir arch/arm/boot/tmp/system/lib
mkdir arch/arm/boot/tmp/system/lib/modules

find ./ -name *.ko | xargs -I FILE cp FILE arch/arm/boot/tmp/system/lib/modules/

cp arch/arm/boot/zImage arch/arm/boot/tmp/

if [ -z "$1" ]; then 
  outfile="$(pwd)/../JetKernel-binary_$(date +%Y%m%d.%s).tgz"
  echo "No output filename given. Using default filename $outfile"
else
  outfile="$(pwd)/"$1
fi

cd arch/arm/boot/tmp
tar czvf $outfile *
cd ..
rm -rf tmp
