# Procédure d'installation de la toolbox:

1. Git clone de la toolbox à la main
2. Création d'un virtualenv à la main
3. Lancer le(s) script(s) d'installation à la main. Ces script vont:
	3.0 installer des libraries	
	3.1 installer sublime & co
	3.2 supprimer le .git du projet toolbox
	3.3 faire un git init sur projet_id
	3.4 créer les liens symboliques depuis ``.git/hooks`` vers ``conf/hooks`` (il faut que les liens soient executables)
4. Ajouter le repo git remote à la main "git remote add.."