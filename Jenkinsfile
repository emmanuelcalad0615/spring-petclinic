#!groovy

pipeline {
  agent none

  stages {
    stage('Maven Install') {
      agent {
        docker {
          // Imagen de Maven con Java 25 (Eclipse Temurin)
          image 'maven:3.9-eclipse-temurin-25'
          reuseNode true
        }
      }

      steps {
        // Limpiar y compilar el proyecto
        sh 'mvn clean install'
      }
    }
  }
}
