pipeline {
  agent none

  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.9-eclipse-temurin-25'
          reuseNode true
        }
      }
      steps {
        echo 'Compilando el proyecto con Maven...'
        sh 'mvn clean install'
      }
    }

    stage('Docker Build') {
      agent any
      steps {
        echo 'Construyendo la imagen Docker...'
        sh 'docker build -t emmanuecalad/spring-petclinic:latest .'
      }
    }

    stage('Docker Push') {
      agent any
      steps {
        echo 'Subiendo la imagen a Docker Hub...'
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "echo $dockerHubPassword | docker login -u $dockerHubUser --password-stdin"
          sh 'docker push emmanuecalad/spring-petclinic:latest'
        }
      }
      post {
        always {
          sh 'docker logout'
        }
      }
    }
  }
}
