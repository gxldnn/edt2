#!/bin/bash
####################################################################
# ASIX_M0374_RA2_P1.3 - Esquelet d'Script per a la Creació d'Usuaris
#
# Objectiu: Completar les línies marcades amb EQC (Escriu Aquí la Comanda).
#
# Ferran Segura - Institut Escola del Treball
####################################################################

#
# Functions
#
# --- Funció de Verificació ROOT ---
# (Aquesta us la dono feta, és una bona pràctica)

DATE=`date +%y/%m/%d_%H:%M:%S` # data actual
LOG_DIR="$(pwd)/auto"
LOGFILE="$LOG_DIR/logfile.log"
ERRFILE="$LOG_DIR/errfile.log" # Log per a errors bonics :)
DETAILOG="$LOG_DIR/detailederror.log" # Log per a errors literals de terminal
mkdir -p "$LOG_DIR"
touch "$LOGFILE" "$ERRFILE"

func_check_root()
{
   echo "[*] Verificant privilegis..."
   if [ "$(id -u)" -ne 0 ]
   then
       echo "[ERROR] Aquest script s'ha d'executar com a root (amb sudo)." 
       exit 1
   fi
   echo "[OK] Executant com a root."
}

if [ -z "$1" ] || [[ "$1" != *.csv ]]; then
    echo -e "No s'ha especificat un arxiu CSV/valid com a parametre"
    exit 99
fi








csv_reader()
{
    # Lo del tr lo he sacado del GPT porque un poco mas i me suicido
    # basicamente lo que hace es cargarse los saltos de linea "\r" 
    # que lo unico que hacen es joder la lectura del CSV
    
    IFS=';'

    [ ! -f "$1" ] && { printf "%s No existeix\n" "$1" >> "$ERRFILE"; exit 99; } # Control de error, per si no existeix el CSV especificat
    
    tr -d '\r' < "$1" | while IFS=';' read -r accio username nom_complet shell grup_primari grups_secundaris
    do  
        if [ "$accio" = "CREAR" ]; then
            
            if [[ -z "$username" || -z "$shell" || -z "$grup_primari" ]]; then
                echo -e "$DATE [99] Falta info fiera, revisa el csv pls... apartat (CREAR)" >> $ERRFILE
                exit 99
            fi

            if [[ -z $nom_complet ]]; then
                nom_complet=none
            fi

            if ! useradd -m -c "$nom_complet" -s "$shell" -g "$grup_primari" "$username" >>$LOGFILE 2>>$DETAILOG; then
                echo "$DATE [ERROR] No es pot crear el usuari $username, ja existeix, informacio correcta?" >> $ERRFILE
                else
                echo "$DATE [OK] Usuari $username ha sigut creat" >>$LOGFILE
            fi
            IFS=',' read -r -a group_array <<< "$grups_secundaris"
            for group in "${group_array[@]}"; do
                if getent group "$group" > /dev/null 2>&1; then
                    usermod -aG "$group" "$username" >> "$LOGFILE" 2>>"$DETAILOG"
                    if [ $? -eq 0 ]; then # El chatgpt m'ha dit que usermod en aquest cas si que te retorn 0 exit no com la resta
                        echo "$DATE [OK] S'ha afegit $group com a grup secundari de $username" >> "$LOGFILE"
                    else
                        echo "$DATE [ERROR] No s'ha pogut afegir $group com a grup secundari de $username" >> "$ERRFILE"
                    fi
                else
                    echo "$DATE [WARNING] Grup $group no existeix... no agregant grup secundari a usuari $username" >> $ERRFILE 
                fi
            done

        elif [ "$accio" == "MODIFICAR_GRUPS" ]; then

            IFS=',' read -r -a group_array <<< "$grups_secundaris"
            for group in "${group_array[@]}"; do
                if getent group "$group" > /dev/null 2>&1; then
                    usermod -aG "$group" "$username" >> "$LOGFILE" 2>>"$DETAILOG"
                    if [ $? -eq 0 ]; then
                        echo "$DATE [OK] S'ha afegit $group com a grup secundari de $username" >> "$LOGFILE"
                    else
                        echo "$DATE [ERROR] No s'ha pogut afegir $group com a grup secundari de $username" >> "$ERRFILE"
                    fi
                else
                    echo "$DATE [WARNING] Grup $group no existeix... no agregant grup secundari a usuari $username" >> $ERRFILE 
                fi
            done
        elif [ "$accio" == "ESBORRAR" ]; then
            if ! userdel -r "$username" >>"$LOGFILE" 2>>$DETAILOG; then 
                echo "$DATE [ERROR] No s'ha pogut eliminar l'usuari $username, existeix?" >> "$ERRFILE"
            else
                echo "$DATE [OK] Usuari $username eliminat correctament" >> "$LOGFILE"
            fi
        fi    
    done
}

func_check_root
csv_reader "$1"
exit 0
