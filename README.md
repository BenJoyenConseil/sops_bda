# Démo SOPS et repo git

	sops -i -e --gcp-kms projects/sops-246117/locations/global/keyRings/git-secrets/cryptoKeys/master secrets.env
