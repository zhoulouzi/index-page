pipeline {
  environment {
    DOCKER_REPO = 'zhoulouzi/index-page'
  }
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
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-socket-volume
    securityContext:
      privileged: true
  volumes:
  - name: docker-socket-volume
    hostPath:
      path: /var/run/docker.sock
      type: File
"""
    }
  }
  stages {
    stage('Clone repo') {
      steps{
        container('docker') {
          checkout scm
        }
      }
    }
    stage('Run docker') {
      steps {
        container('docker') {
          sh 'docker version'
          script {
            docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-auth') {
              def image = docker.build("${env.DOCKER_REPO}:${env.BUILD_ID}")
              image.push()
              // image.push('latest')
            }
          }
        }
      }
    }
  }
}
