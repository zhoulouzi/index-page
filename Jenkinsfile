pipeline {
  agent {
    kubernetes {
      label 'mypod'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: jenkins-slave
spec:
  containers:
  - name: jnlp
    image: jenkins/jnlp-slave:3.27-1
    args: ['\$(JENKINS_SECRET)', '\$(JENKINS_NAME)']
  - name: docker
    image: docker:18.06.1-ce
    command:
    - cat
    tty: true
"""
    }
  }
  stages {
    stage('Run docker') {
      steps {
        container('docker') {
          sh 'docker version'
        }
      }
    }
  }
}
