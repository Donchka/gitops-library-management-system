{{/* Define fullname helper */}}
{{- define "library-management-system.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Define name helper */}}
{{- define "library-management-system.name" -}}
{{- .Chart.Name -}}
{{- end -}}