### installation de la toolbox sur votre poste local 

1. 
lancer le script install.sh 

    il permet d'installer les paquets systeme suivants :
        -sublime text
        -sphinx-doc 
        -python-scikits-learn
        -python-pudb
        
    il va egalement suprimer le .git actuel et initier un nouveau repo 
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
    import urllib.request,os,hashlib;
    h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76';
    pf = 'Package Control.sublime-package';
    ipp = sublime.installed_packages_path();
    urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) );
    by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read();
    dh = hashlib.sha256(by).hexdigest();
    print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
    ```
    
    une fois cette commande lancée installer les paquet suivant avec cette procedure :
    
        -  control + shift + p
        - taper la comande install dans la fenetre
        - selectioner package control : install package
        - dans cette fenetre renseigner le nom de package suivant :
                - anaconda

