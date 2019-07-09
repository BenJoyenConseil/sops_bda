# SOPS et repo git

* [SOPS](https://github.com/mozilla/sops) (Secrets OPerationS) est un utilitaire 
en ligne de commande ou sous forme de module, pour chiffrer et déchiffrer des fichiers 
de variable d'environnement contenant des informations sensibles 
(credentials, clés, token d'API, etc...).

* différent d'un chiffrement classique sur l'ensemble d'un fichier, SOPS sait **chiffrer
seulement la valeur** d'une variable et laisser en clair le reste du fichier.

*ex* : 
    
    LOGIN=ENC[AES256_GCM,data:RJuaFy7ZN/dz2Q==,iv:KphLbeEFKDJDUTVlMZMFVNJWAGJRyOpLkMmnqK56jso=,tag:cOJjZ2GaUYJH5NjQEtFjCw==,type:str]

* capable de ne **chiffrer** que certaines **variables suffixées**, 
la [doc](https://github.com/mozilla/sops#usage) est très complète et montre de nombreux exemples
 (avec aws, azure, gcp, pgp, etc...). 

 * Ce repos contient des fichiers chiffrés avec 1 ([secrets.env](secrets.env)) ou plusieurs master key 
([conf.json](conf.json),  [docker-compose.yaml](docker-compose.yaml)).

Une clé pgp est fournie [mykey.asc](mykey.asc) pour déchiffrer avec gpg


## Chiffrement "sur place" :

	sops -i -e --gcp-kms projects/sops-246117/locations/global/keyRings/git-secrets/cryptoKeys/master secrets.env
	
## Déchiffrement "sur place" :

	sops -i -d secrets.env


## Avec plus d'une clé

	sops -e -pgp E0F12EA084256D41A4470B5A7496D178F1A20481 --gcp-kms projects/sops-246117/locations/global/keyRings/git-secrets/cryptoKeys/second-in-case-of-boulette conf.json
	gpg --import mykey.asc
	sops -i -d conf.json
