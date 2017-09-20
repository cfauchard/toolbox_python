# Procédure d'installation de la toolbox:

Afin de proceder à l'installation de la toolbox vous devez avoir une installation de miniconda sur votre ordinateur.

Si vous en avez déjà un, passez à l'étape 2.

## Installation de miniconda et création d'un virtualenv

1. Récuperer les paquet minicondas: 
    * `$ curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh`
2. Installer minicondas dans votre ``yourTargetDirectory``: 
      `$ bash miniconda.sh -b -p yourTargetDirectory` `
      Les dossiers suivants devraient être crées:
      bin, conda-meta, **envs**, etc, include, lib, LICENSE.txt, pkgs, share   et ssl.
      
Vous pouvez ensuite ajouter ``yourTargetDirectory/bin`` dans votre PATH pour que conda soit accesible. 



## Installation de la toolbox

Pour installer la toolbox, vous devez avoir déjà installé miniconda sur votre poste de travaille.

1. Placez vous dans le dossier ou vous souhaitez inittialiser le projet.
2. Git clone de la toolbox à la main: 
   `git clone git@gitlab.com:gintronati/toolbox_python.git`
3. Installation de la toolbox à la main
    * lancer le script ``install.sh`` (dans le dossier ``toolbox``) 
     + il permet de créer un virtualenv avec tous les paquets listés dans ``environment.yml``
     + installer les paquets systeme suivants : sublime text
        + il va egalement supprimer le .git de la toolbox et initier un nouveau repo git dans le dossier projectId
        + créer les liens symboliques depuis ``.git/hooks`` vers ``conf/hooks`` (il faut que les liens soient executables)
        + vous allez pouvoir indiquer si vous souhaitez installer sublime
        + il vous sera demandé quelle branche du projet fbd_tools vous souhaitez installer
        + Dans le cas où vous allez travailler sur la toolbox (apporter des évolutions ou des corrections) vous devez passer *dev* en argument de bash install.sh 
4. Ajouter le nouveau repo; lancer la commande
    * bash  ```git remote add origin $(git url)```

5. Installer les plugins de Sublime Text avec: 
    * bash ```subl```
    * ouvrir la console sublime text dans le menu :
        + View > Show Console
        + copier coller le script suivant :
        ```pythonimport urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)```
    * une fois cette commande lancée installer les paquet suivant avec cette procedure :
        + control + shift + p
        + taper la comande install dans la fenetre
        + selectioner package control : install package
        + dans cette fenetre renseigner le nom de package suivant : ```anaconda```

#### Optional:

Pour ignorer la règle de la longeur de lignes du code: 

Copier les settings d'anaconda dans sublime  
	Preferences -> Package Setting -> Anaconda -> Settings -Default et selectioner tout le contenu 
    et copier.
    
    Coller le contenu dans Preferences -> Package Setting -> Anaconda -> Settings - User
    et remplacer la ligne  "pep8_ignore" par
```
"pep8_ignore":
    [
        "E309", "E501"
    ],
```
Normalement il faut juste ajouter E501.

#### Known issues

Le path vers le repertoire où vous installez la toolbox ne doit pas contenir d'espaces. 
Par exemple, ``home/pepito/Usine Logicielle/toolbox`` ne fonctionne pas à cause de l'espace dans Usine Logicielle.

## Activation d'un virtual env
1. Pour créer un virtual env associé au projet dans lequel vous allez travailler, lancer `yourTargetRepository/bin/conda create -n $PROJECT_NAME`python
    * Un nouveau dossier ``yourTargetRepository/envs/$PROJECT_NAME`` est crée.

2. Pour l'activer, lancer  
      `$ source yourTargetRepository/bin/activate $PROJECT_NAME`
    * ``$PROJECT_NAME$`` s'affiche devant le prompt.

