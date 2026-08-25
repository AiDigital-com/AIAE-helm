{{- define "java-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "java-service.labels" -}}
app.kubernetes.io/name: {{ include "java-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backend
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "java-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "java-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "java-service.secretName" -}}
{{ include "java-service.name" . }}-secret
{{- end -}}
