read -p "Introdueix un fitxer o directori o tar.gz (tambe si vols, la seva ruta): " input

if [[ "$input" == *.tar.gz ]]; then
    descompacta "$input"
else
    compactar "$input"
fi
