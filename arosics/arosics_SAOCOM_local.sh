TARGET="/media/nmorandeira/T7/Img_preprocesadas/SAOCOM/SAOCOM_StripMap_QP/decomp/*/*.tif" #path to target image folder

REF="/media/nmorandeira/T7/Sentinel2_arosics/S2B_MSIL2A_20220416T140049_N0400_R067_T20HQK_HQJ_mosaic_WGS84.tif" #path to ref image
ENV="prosat" #name of the Python environment


echo "activate Python environment $ENV"
source ~/anaconda3/etc/profile.d/conda.sh
conda activate $ENV

echo "using $REF as reference"
for f in $TARGET

do
  echo "Processing $f file as target..."
  arosics local $REF $f 30 -br 4 -bs 1 -fmt_out 'GTIFF' -min_reliability 0 -v 1 -q 0 |& tee -a output_AscS8S9_decomp_local30.txt
done
