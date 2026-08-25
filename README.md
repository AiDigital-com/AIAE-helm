# AIAE Helm

Reusable Helm charts for AIAE services. Operational Hub is the first deployed
service.

Branches:

- dev - development chart/app manifests
- prod - production chart/app manifests

Argo CD reads `charts/java-service` from this repository and values from the
matching branch in `AIAE-helm-versions`.
