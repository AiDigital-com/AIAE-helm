{{- define "aiae-presentation-builder-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "aiae-presentation-builder-api.labels" -}}
app.kubernetes.io/name: {{ include "aiae-presentation-builder-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backend
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "aiae-presentation-builder-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aiae-presentation-builder-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "aiae-presentation-builder-api.secretName" -}}
{{ include "aiae-presentation-builder-api.name" . }}-secret
{{- end -}}
