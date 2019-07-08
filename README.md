# Démo SOPS et repo git

## Chiffrement "sur place" :

	sops -i -e --gcp-kms projects/sops-246117/locations/global/keyRings/git-secrets/cryptoKeys/master secrets.env
	
## Déchiffrement "sur place" :
	sops -i -d secrets.env
