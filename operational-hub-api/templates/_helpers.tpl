{{- define "operational-hub-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "operational-hub-api.labels" -}}
app.kubernetes.io/name: {{ include "operational-hub-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backend
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "operational-hub-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "operational-hub-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "operational-hub-api.secretName" -}}
{{ include "operational-hub-api.name" . }}-secret
{{- end -}}
