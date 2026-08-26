# AIAE Helm

App-of-apps repository for AIAE services.

Branch ownership:

- `main` contains deployable service charts such as `operational-hub-api`.
- `dev` contains the development root chart and environment configuration.
- `prod` contains the production root chart and environment configuration.

Argo CD starts from the `aiae` root chart on the environment branch. That root
creates one child Application per service and pins both the service chart and
the matching commit from `AIAE-helm-versions`.
