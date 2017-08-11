### installation de la toolbox sur votre poste local 

1. 
lancer le script install.sh 

    il permet d'installer les paquets systeme suivants :
        -sublime text
        -sphinx-doc 
        -python-scikits-learn
        -python-pudb
        
    il va egalement supprimer le .git actuel et initier un nouveau repo 
    pour ajouter le nouveau repo lancer la commande :
    ```bash
    git remote add origin $(git url)
    ```
    
2. lancer sublime text avec la commande: 
    ```bash
    subl
    ```
    
    ouvrir la console sublime text dans le menu : 
        
        View > Show Console
    
    copier coller le script suivant :
    
    ```python
    import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
    ```
    
    une fois cette commande lancée installer les paquet suivant avec cette procedure :
    
        -  control + shift + p
        - taper la comande install dans la fenetre
        - selectioner package control : install package
        - dans cette fenetre renseigner le nom de package suivant :
                - anaconda


# Procédure d'installation de la toolbox:


1. Git clone de la toolbox à la main
2. Création d'un virtualenv à la main
3. Lancer le(s) script(s) d'installation à la main. Ces script vont:
    3.0 installer des libraries 
    3.1 installer sublime & co
    3.2 supprimer le .git du projet toolbox
    3.3 faire un git init sur projet_id
    3.4 créer les liens symboliques depuis .git/hooks vers conf/hooks (il faut que les liens soient executables)
4. Ajouter le repo git remote à la main "git remote add.."
