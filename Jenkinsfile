#!groovy

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
        echo 'Building Spring PetClinic with Maven...'
        sh 'mvn clean install'
      }
    }

    stage('Docker Build') {
      agent any
      steps {
        echo 'Building Docker image for Spring PetClinic...'
        sh 'docker build -t emmanuelcalad0615/spring-petclinic:latest .'
      }
    }
  }
}
