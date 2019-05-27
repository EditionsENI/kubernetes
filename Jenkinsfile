podTemplate(
  label: "demo-build",
  // Keep docker container started for 10 minutes before deleting it
  idleMinutes: 10,
  // Uncomment to use secret to pull secret image
  // imagePullSecrets: [ 'github-cred' ],

  // Use service account to allow patch deployment in develop namespace
  serviceAccount: 'jenkins-updater',

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
      name: 'docker',
      image: 'docker:18.06',
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
    secretVolume(secretName: 'docker-hub-cred', mountPath: '/home/jenkins/docker'),
    hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')
  ]
) {
  node("demo-build") {
//     stage("checkout") {
//       checkout scm
//     }
//     container('python') {
//       stage("prereq") {
//         sh("pip install -r flask-healthcheck/requirements.txt pylint")
//       }
//       stage('linter') {
//         sh("pylint flask-healthcheck --exit-zero")
//       }
//     }
//     container('docker') {
//       stage('build') {
//         sh("cd flask-healthcheck && docker build -t yannig/flask-healthcheck:latest .")
//       }
//       stage('login') {
//         sh('''
//           awk -F'"' '{ print "docker login --"$6"="$8" --"$10"="$12 }' /home/jenkins/docker/.dockerconfigjson > login.sh
//           chmod +x login.sh && ./login.sh ; rm login.sh
//           ''')
//       }
//       stage('push') {
//         sh("docker push yannig/flask-healthcheck:latest")
//       }
//     }
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
