{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mychart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mychart.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mychart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create urls for api
*/}}
{{- define "api.uri" -}}
{{- if .Values.tls.enabled -}}
{{- printf "https://%s" .Values.api.host -}}
{{- else -}}
{{- printf "http://%s" .Values.api.host -}}
{{- end -}}
{{- end -}}

{{/*
Create urls for ui
*/}}
{{- define "ui.uri" -}}
{{- if .Values.tls.enabled -}}
{{- printf "https://%s" .Values.ui.host -}}
{{- else -}}
{{- printf "http://%s" .Values.ui.host -}}
{{- end -}}
{{- end -}}

{{/*
Create urls for store
*/}}
{{- define "store.uri" -}}
{{- if .Values.tls.enabled -}}
{{- printf "https://%s" .Values.store.host -}}
{{- else -}}
{{- printf "http://%s" .Values.store.host -}}
{{- end -}}
{{- end -}}

{{/*
  Determine the hostname to use for postgresql
*/}}
{{- define "postgresql.hostname" -}}
{{- if .Values.postgresql.enabled -}}
{{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" .Values.postgresql.postgresServer -}}
{{- end -}}
{{- end -}}

{{/*
  Create a default fully qualified postgresql name.
  We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgresql.fullname" -}}
{{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
