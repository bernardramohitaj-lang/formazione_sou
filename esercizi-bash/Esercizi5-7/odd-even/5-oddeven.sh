#!/bin/bash
# ============================================================================
# ESERCIZIO: ODD/EVEN
#
# Traccia:
#   Scrivere uno script che accetti un argomento numerico e stampi la sequenza
#   di numeri da 1 a quel numero con l'indicazione se è pari o dispari.
#   Controllare il corretto numero di argomenti passati allo script e che
#   l'argomento sia di tipo numerico, in caso contrario generare una
#   condizione di errore.
#
# Esecuzione:
#   chmod +x oddeven.sh
#   ./oddeven.sh 5
#
# Output atteso:
#   1 è dispari
#   2 è pari
#   3 è dispari
#   4 è pari
#   5 è dispari
#
# Casi di errore (exit code 1 = argomenti errati, 2 = non numerico):
#   ./oddeven.sh          -> errore (nessun argomento)
#   ./oddeven.sh 3 4      -> errore (troppi argomenti)
#   ./oddeven.sh abc      -> errore (non numerico)
# ============================================================================

# Controllo numero di argomenti: ne serve esattamente 1
if [ "$#" -ne 1 ]; then
    echo "Errore: numero di argomenti errato." >&2
    echo "Uso: $0 <numero_intero_positivo>" >&2
    exit 1
fi

# Controllo che l'argomento sia numerico (solo cifre)
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Errore: '$1' non è un numero intero positivo." >&2
    exit 2
fi

# 10# forza la base decimale (evita che 008 venga letto come ottale)
N=$((10#$1))

# Ciclo da 1 a N: se il resto della divisione per 2 è 0 è pari, altrimenti dispari
for (( i = 1; i <= N; i++ )); do
    if (( i % 2 == 0 )); then
        echo "$i è pari"
    else
        echo "$i è dispari"
    fi
done
