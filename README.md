# Exemples pour le livre Kubernetes ENI

Ce repository contient un ensemble d'exemples pour le livre Kubernetes aux éditions ENI.

Ci-dessous un descriptif des éléments présents :

- Répertoire chapitres : fichiers présents dans l'ouvrage regroupés par chapitre. Certains fichiers sont versionnés à l'aide de -v1/2/3
- Répertoire flask-healthcheck : répertoire de l'application d'exemple flask-healthcheck présentée dans le livre
- Fichier Jenkinsfile : fichier d'exemple de CI-CD étudié dans le livre
- Répertoire misc : ressources d'exemple
- Fichier README.md : le fichier que vous être en train de lire


# Correctifs chapitres

## Sécurisation : accès aux applications

Depuis la version 0.11 du chart Helm stable/cert-manager, le contenu du champ apiVersion a évolué. Ce champ ne doit plus contenir "certmanager.k8s.io/v1alpha1" mais "cert-manager.io/v1alpha2".

Les exemples du livre ont été mis à jour en conséquence.

Une autre solution est de déployer la version 0.10 (v0.10.1) à l'aide des options --version v0.10.1.
