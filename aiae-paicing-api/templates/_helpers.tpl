{{- define "aiae-paicing-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "aiae-paicing-api.labels" -}}
app.kubernetes.io/name: {{ include "aiae-paicing-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backend
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "aiae-paicing-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aiae-paicing-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "aiae-paicing-api.secretName" -}}
{{ include "aiae-paicing-api.name" . }}-secret
{{- end -}}

{{/*
The migration Job's projected secret is SEPARATE from the application's. It is
the only one carrying the RDS master credentials, and the application's IAM
role cannot read them — so a shared SecretProviderClass would not merely be
untidy, it would fail the application pod's volume mount with AccessDenied.
*/}}
{{- define "aiae-paicing-api.migrateName" -}}
{{ include "aiae-paicing-api.name" . }}-migrate
{{- end -}}

{{- define "aiae-paicing-api.migrateSecretName" -}}
{{ include "aiae-paicing-api.migrateName" . }}-secret
{{- end -}}
