source:
  kind: githubRelease
  name: "Get jenkins-wiki-exporter latest version"
  spec:
    owner: "jenkins-infra"
    repository: "jenkins-wiki-exporter"
    token: {{ requiredEnv "GITHUB_TOKEN" }}
    username: "olblak"
    version: "latest"
conditions:
  docker:
    name: "Is Docker Image Published on Registry?"
    kind: dockerImage
    spec:
      image: "halkeye/jenkins-wiki-exporter"
targets:
  imageTag:
    name: "Update docker image tag jenkins-wiki-exporter used in helm chart"
    kind: yaml
    spec:
      file: "charts/jenkins-wiki-exporter/values.yaml"
      key: image.tag
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "{{ .github.owner }}"
        repository: "{{ .github.repository }}"
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "{{ .github.branch }}"
  appVersion:
    name: "Update chart appversion for jenkins-wiki-exporter helm chart"
    kind: yaml
    spec:
      file: "charts/jenkins-wiki-exporter/Chart.yaml"
      key: appVersion
    scm:
      github:
        user: "{{ .github.user }}"
        email: "{{ .github.email }}"
        owner: "{{ .github.owner }}"
        repository: "{{ .github.repository }}"
        token: "{{ requiredEnv .github.token }}"
        username: "{{ .github.username }}"
        branch: "{{ .github.branch }}"
