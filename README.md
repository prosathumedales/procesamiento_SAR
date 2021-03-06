# Procesamiento de datos satelitales SAR

Grafos para el procesamiento de escenas satelitales SAR con SNAP, versión 8.

**Autores/as:** Natalia Morandeira, Matías Barber, Mercedes Salvia.


## Sentinel-1
### Dual-Pol IW - Level GRD
- **[Grafo](https://github.com/prosathumedales/procesamiento_SAR/blob/main/ProcGrafo_Sentinel1_EC_LeeSigma7x7.xml)**
- **Procesos:** Lectura, Calibración radiométrica, Filtro Lee Speckle, Georreferenciación (Ellipsoid Correction), Subset espacial, Escritura a disco.
- **Output:** GeoTiff con VH, VV, incidence_angle

## ALOS/PALSAR-1
### Fine Beam Single ó Fine Beam Dual - Level GRD
_Estos grafos están preparados para correr en bash con argumentos NombreArchivo y NombreTarget para el input y output._
- **[Grafo para FBS](https://github.com/prosathumedales/procesamiento_SAR/blob/main/ProcGrafo_ALOS-PALSAR1_FBS_GRD_mosaic_LeeSigma7x7_BASH.xml)**
- **[Grafo para FBD](https://github.com/prosathumedales/procesamiento_SAR/blob/main/ProcGrafo_ALOS-PALSAR1_FBD_GRD_mosaic_LeeSigma7x7_BASH.xml)**
- **Procesos:** Lectura, Calibración radiométrica, Filtro Lee Speckle, Georreferenciación a través de SAR Moisaic, Subset espacial, Escritura a disco.
- **Output:** GeoTiff con  incident_angle, HH (Single Pol) ó incident_angle, HV, HH (Dual Pol)

### Full Polarimétricas - Level SLC
- **[Grafo](https://github.com/prosathumedales/procesamiento_SAR/blob/main/ProcGrafo_ALOS-PALSAR1_SLC_C3_LeeSigma7x7_Decomp.xml)**
- **Input:** escena ALOS/PALSAR PLR, level SLC
- **Procesos:** Lectura, Calibración radiométrica, Extracción de matriz C3 con Filtro Lee Speckle, Descomposición de Cloude-Pottier (H/A/Alpha), Descomposición de Freeman Durden, Ellipsoid Correction, Subset espacial, Stack de todas las bandas, Escritura a disco.
- **Output:** GeoTiff con C11 (HH),  C13_real, C13_imag, C22 (2HV), C33 (VV), incidence_angle, Freeman_dbl, Freeman_vol, Freeman_surf, Entropy, Anisotropy,
Alpha.

## SAOCOM
### Full Polarimétricas - Level SLC - Modos StripMap y TopSAR Narrow
_Estos grafos están preparados para correr en bash con argumentos NombreArchivo y NombreTarget para el input y output._

Dado el peso de las escenas SAOCOM, generamos dos grafos: 

- **[Grafo 1 - Extracción de C3 con filtro polarimétrico](https://github.com/prosathumedales/procesamiento_SAR/blob/main/ProcGrafo_SAOCOM_SLC_C3_LeeSigma7x7_BASH.xml)**
- **Input:** escena SAOCOM StripMap o TopSAR Narrow, Level SLC
- **Procesos:** Lectura, Subset espacial, Extracción de matriz C3 con Filtro Lee Speckle polarimétrico, Ellipsoid Correction, Escritura a disco.
- **Output:** GeoTiff con C11 (HH),  C13_real, C13_imag, C22 (2HV), C33 (VV), incidence_angle.

- **[Grafo 2 - Descomposiciones polarimétricas en ventana de 5x5, sin filtro previo](https://github.com/prosathumedales/procesamiento_SAR/blob/main/ProcGrafo_SAOCOM_SLC_Decomp_BASH.xml)**
- **Input:** escena SAOCOM StripMap o TopSAR Narrow, Level SLC
- **Procesos:** Lectura, Subset espacial, Descomposición de Cloude-Pottier (H/A/Alpha), Descomposición de Freeman Durden, Ellipsoid Correction, Subset espacial, Stack de todas las bandas, Escritura a disco.
- **Output:** GeoTiff con Freeman_dbl, Freeman_vol, Freeman_surf, Entropy, Anisotropy, Alpha, incidence_angle.

Los grafos están preparados para correr por línea de comandos en bash con _gpt_. El parámetro para los archivos input es _NombreArchivo_ y el parámetro para los archivos de salida es _NombreTarget_.
 

## Licencia
[Ver detalles aquí](https://github.com/prosathumedales/procesamiento_SAR/blob/main/LICENSE.md).

El proyecto está en desarrollo, consultar cómo citar. Contacto: Natalia Morandeira (nmorandeira@unsam.edu.ar, [@nmorandeira](https://github.com/nmorandeira))
