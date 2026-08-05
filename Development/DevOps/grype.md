
Template to show Artifact paths: 

```
NAME                INSTALLED    VULNERABILITY    SEVERITY    PATH
{{- range .Matches}}
{{.Artifact.Name}}  {{.Artifact.Version}}  {{.Vulnerability.ID}}  {{.Vulnerability.Severity}}  {{(index .Artifact.Locations 0).RealPath}}
{{- end}}
```

```bash
grype <path> -o template -t ./template.tpl
```