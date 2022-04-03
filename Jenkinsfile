podTemplate(
  label: "python-builder",
  // Keep docker container started for 10 minutes before deleting it
  // idleMinutes: 10,
  // Affect service account to update develop
  serviceAccount: 'jenkins-updater',
  // Uncomment to use secret to pull secret image
  // imagePullSecrets: [ 'github-cred' ],
  // Containers to create
  containers: [
    containerTemplate(
      name: 'python',
      image: 'python:3',
      ttyEnabled: true,
      command: 'cat',
      resourceRequestMemory: "200M",
      resourceLimitMemory: "250M"
    ),
    containerTemplate(
      name: 'kaniko',
      image: 'gcr.io/kaniko-project/executor:v1.8.0-debug',
      ttyEnabled: true,
      command: 'cat'
    ),
    containerTemplate(
      name: 'kubectl',
      image: 'gcr.io/cloud-builders/kubectl',
      ttyEnabled: true,
      command: 'cat'
    ),
  ],
  volumes: [
    secretVolume(
      secretName: 'docker-hub-cred',
      mountPath: '/home/jenkins/docker'
    )
  ]
) {
  node("python-builder") {
    stage("checkout") {
      checkout scm
    }
    container('python') {
      stage("prereq") {
        sh("pip install -r flask-healthcheck/requirements.txt")
        sh("pip install pylint")
      }
      stage('linter') {
        sh("pylint flask-healthcheck --exit-zero")
      }
    }
    container('kaniko') {
      def imageName = "yannig/flask-healthcheck:latest"
      stage('login') {
        sh('''
          mkdir -p /kaniko/.docker
          cp /home/jenkins/docker/.dockerconfigjson /kaniko/.docker/config.json
          sed -i 's|docker.io|https://index.docker.io/v1/|g' /kaniko/.docker/config.json
          ''')
      }
      stage('build') {
        sh("/kaniko/executor --context flask-healthcheck --destination docker.io/${imageName}")
      }
    }
    container('kubectl') {
      stage('update-develop') {
        def time = System.currentTimeMillis()
        def patch = """{"spec":{"template":{"metadata":{"labels":{"date":"${time}"}}}}}"""
        patch = patch.replace('"', '\\"')
        sh("kubectl -n develop patch deployment test -p \"${patch}\"")
      }
    }
  }
}
