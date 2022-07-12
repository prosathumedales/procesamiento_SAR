TARGET="/media/nmorandeira/T7/Img_preprocesadas/SAOCOM/SAOCOM_StripMap_QP/polariz/Asc_S9/*/*.tif" #path to target image folder

REF="/media/nmorandeira/T7/Sentinel2_arosics/S2B_MSIL2A_20220416T140049_N0400_R067_T20HQK_HQJ_mosaic_WGS84.tif" #path to ref image
ENV="prosat" #name of the Python environment

#Define central point of the correlation window

LAT_POINT=-32.38688927  #Ascending S9
LONG_POINT=-60.52930807


echo "activate Python environment $ENV"
source ~/anaconda3/etc/profile.d/conda.sh
conda activate $ENV

echo "using $REF as reference"
for f in $TARGET

do
  echo "Processing $f file as target..."
  #arosics global $REF $f -max_iter 100 -max_shift 100 -ws 512 512 -fmt_out 'GTIFF' -v 1 -q 0 #sin indicar coordenadas, busca coord centrales
  arosics global $REF $f -wp $LONG_POINT $LAT_POINT -max_iter 10000 -max_shift 30 -ws 100 100 -nodata 0 0 -br 4 -bs 1 -fmt_out 'GTIFF' -v 0 -q 0 |& tee -a output_AscS9.txt #indicando coordenadas 
done
