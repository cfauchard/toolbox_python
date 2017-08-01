## Projet count_word. 
Ce projet porte sur le calcul de la fréquence de mots d'un paragraph Lorem Ipsum. Un fichier input contient le paragraph à traiter. Celui-ci est chargé et puis transofmé: le mot Lorem est enlevé et la sequence de mots est inversée. La derniere phase consiste à calculer la frequence de mots. Le résultat (un dictionaire avec les mots et la nombre d'apparition associé) est écrit dans un fichier output.

Normalement les données se trouvent dans le Data Lake qui porte la même structure landing/refinery/gold que le répertoire tmp/data de ce projet.

### README
Decription générale et technique du projet.

### data_factory

Tous les scripts d'importation/transformation/exportation de données se trouvent dans ce répertoire. **Aucun module ou librarire ne doit être déposée ici**. 


``import.py``va lire le fichier d'input et le copier dans le refinery (cette étape n'est pas forcement necessaire) "as is". 

``clean.py`` va nettoyer les données: enlever le mot Lorem et déposer le fichier dans le refinery.

``transform.py`` va récuperer les données nettoyagées et inverser la sequence de mots pour ensuite compter le nombre d'occurrences de chaque mot. Le résultat final est déposé dans le gold area. 

### modules

Mettez ici tous les modules que vous créez pour votre projet. Mettez dans le réperoire ``utils`` toutes les fonctions auxiliaires.

### config 

Tous les fichiers de configuration necessaires au projet et au deploiement de l'application sont ici. Penser à mettre le fichier ``requirements.txt`` ici.

### tmp

Mettez dans ``tmp/log`` le(s) log file(s) générées par votre application

###  doc
Toute la documentation génerée par sphinx ou autre à partir de docstrings.


