#SAOCOM 
#Correr desde directorio en el que estén las escenas

GRAFO= "Nombredelgrafo.xml"

for file in */*.xemt

do
	gpt $GRAFO -PNombreArchivo=$(pwd)/$file -PNombreTarget=$(pwd)/output/$file.tif
done

