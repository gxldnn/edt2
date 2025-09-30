    #!/bin/bash

    read -p "Introdueix el numero del que vols saber el quadrat: " num


    result=$(expr $num \* $num)

    echo -e "El resultat del quadrat de ($num) és ($result)."