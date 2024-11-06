{{/*
    Expand the name of the chart.
    */}}
    {{- define "pas-deploy.name" -}}
    {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
    
    {{/*
    Create a default fully qualified app name.
    */}}
    {{- define "pas-deploy.fullname" -}}
    {{- if .Values.fullnameOverride }}
    {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
    {{- else }}
    {{- $name := default .Chart.Name .Values.nameOverride }}
    {{- printf "%s-%s" $name .Release.Name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
    {{- end -}}
    
    {{/*
    Create chart labels.
    */}}
    {{- define "pas-deploy.labels" -}}
    helm.sh/chart: {{ include "pas-deploy.chart" . }}
    {{ include "pas-deploy.selectorLabels" . }}
    {{- if .Chart.AppVersion }}
    app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
    {{- end }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
    {{- end -}}
    
    {{/*
    Create selector labels.
    */}}
    {{- define "pas-deploy.selectorLabels" -}}
    app.kubernetes.io/name: {{ include "pas-deploy.name" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    {{- end -}}
    
    {{/*
    Expand the chart name and version.
    */}}
    {{- define "pas-deploy.chart" -}}
    {{ .Chart.Name }}-{{ .Chart.Version }}
    {{- end -}}