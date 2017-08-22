# Procédure d'installation de la toolbox:

1. Création d'un virtualenv à la main
    * virtualenv --system-site-packages -p python3 ``yourTargetDirectory``
	(à faire avant si besoin: sudo apt-get install python3-pip python3-dev python-virtualenv # for Python 3.n)
    * dans ``yourTargetRepository``, lancer ``source bin/activate`` pour activer le virtualenv.
    * ``(yourTargetRepository$``) s'affiche devant le prompt.
2. Git clone de la toolbox à la main
3. Lancer le(s) script(s) d'installation à la main
    * lancer le script ``install.sh`` 
        + il permet d'installer les paquets systeme suivants : sublime text, sphinx-doc, python-scikits-learn, python-pudb
        + il va egalement supprimer le .git actuel et initier un nouveau repo
        + créer les liens symboliques depuis .git/hooks vers conf/hooks (il faut que les liens soient executables)
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

