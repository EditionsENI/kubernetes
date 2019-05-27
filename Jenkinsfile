podTemplate(
  label: "demo-build",
  // Uncomment to keep container started
  // idleMinutes: 20,
  // Uncomment to use secret to pull secret image
  // imagePullSecrets: [ 'github-cred' ],
  // Use service account to allow kubectl call
  serviceAccount: 'jenkins',
  containers: [
    containerTemplate(name: 'python', image: 'python:3', ttyEnabled: true, command: 'cat', resourceRequestMemory: "200M", resourceLimitMemory: "250M")
  ],
  volumes: [
    hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')
  ]
) {
  print("hellow world")
}
