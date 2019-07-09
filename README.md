# Démo SOPS et repo git

## Chiffrement "sur place" :

	sops -i -e --gcp-kms projects/sops-246117/locations/global/keyRings/git-secrets/cryptoKeys/master secrets.env
	
## Déchiffrement "sur place" :

	sops -i -d secrets.env


## Avec plus d'une clé

	sops -e -pgp E0F12EA084256D41A4470B5A7496D178F1A20481 --gcp-kms projects/sops-246117/locations/global/keyRings/git-secrets/cryptoKeys/second-in-case-of-boulette conf.json
	gpg --import mykey.asc
	sops -i -d conf.json


## git diff

    git diff 3 conf.json