{{/* Expand the name of the chart. */}}
{{- define "simple-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create a full name. */}}
{{- define "simple-app.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "simple-app.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels */}}
{{- define "simple-app.labels" -}}
helm.sh/chart: {{ include "simple-app.name" . }}
{{ include "simple-app.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels */}}
{{- define "simple-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "simple-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}