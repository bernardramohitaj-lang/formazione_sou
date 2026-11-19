## Supponiamo che abbiamo un file csv con i vostri dati
## nome,cognome,numero
## bisogna estrarre la colonna cognome. La prima lettera deve diventare sempre maiuscola, selezionare solo due cognomi (o uno o l'altro).
## deve essere tutto in pipe.



awk -F',' '{print $2}' eserciziobonusfile.csv | sed 's/^./\U&/' | grep  -i -E '^(roncaccio|bruno)$'