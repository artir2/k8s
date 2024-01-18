{{/*
Expand the name of the chart.
*/}}
{{- define "lcmaas-slayer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lcmaas-slayer.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "lcmaas-slayer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lcmaas-slayer.labels" -}}
helm.sh/chart: {{ include "lcmaas-slayer.chart" . }}
{{ include "lcmaas-slayer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lcmaas-slayer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lcmaas-slayer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Picking up the best value for startup delay
*/}}
{{- define "lcmaas-slayer.startupTime" -}}
{{- if .Values.global }}
{{- if .Values.global.startupTimeSeconds }}
{{- .Values.global.startupTimeSeconds }}
{{- end }}
{{- else if .Values.startupTimeSeconds }}
{{- .Values.startupTimeSeconds }}
{{- else }}
{{- 10 }}
{{- end }}
{{- end }}
