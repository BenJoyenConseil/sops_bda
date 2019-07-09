SHELL=/bin/bash
.SHELLFLAGS = -e -c
.ONESHELL:

.EXPORT_ALL_VARIABLES:
SOPS_GCP_KMS = projects/sops-246117/locations/global/keyRings/git-secrets/cryptoKeys/master
SOPS_PGP_FP = F009D47AE9B844590BDA8BA5A39451B1377A25BD


encrypt-secrets:
	make enc file=secrets.env
	make enc file=docker-compose.yaml
	make enc file=conf.json

decrypt-secrets:
	make dec file=secrets.env
	make dec file=docker-compose.yaml
	make dec file=conf.json

enc:
	sops --encrypt --in-place --gcp-kms ${SOPS_GCP_KMS} $(file)
dec:
	sops --decrypt --in-place $(file)

