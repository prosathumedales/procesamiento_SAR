#TARGET="/home/nat/Documents/PROSAT/SAOCOM_StripMap_QP/*/*.tif" #path to target image folder
TARGET="/home/nmorandeira/Descargas/ALOS_FBS/*.tif" #path to target image folder

REF="/home/nmorandeira/Descargas/Sentinel2/S2B_MSIL2A_20220416T140049_N0400_R067_T20HQK_20220416T195931_WGS84.tif" #path to ref image

ENV="prosat" #name of the Python environment


echo "activate Python environment $ENV"
source ~/anaconda3/etc/profile.d/conda.sh
conda activate $ENV

echo "using $REF as reference"
for f in $TARGET

do
  echo "Processing $f file as target..."
  arosics local $REF $f 50 -br 4 -bs 2 -fmt_out 'GTIFF' -min_reliability 0
done
