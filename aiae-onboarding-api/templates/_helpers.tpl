{{- define "aiae-onboarding-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "aiae-onboarding-api.labels" -}}
app.kubernetes.io/name: {{ include "aiae-onboarding-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backend
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "aiae-onboarding-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aiae-onboarding-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "aiae-onboarding-api.secretName" -}}
{{ include "aiae-onboarding-api.name" . }}-secret
{{- end -}}
