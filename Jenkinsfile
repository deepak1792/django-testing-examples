pipeline {

  agent any

    stages {

            stage ('Checkout') {
           
            steps{
                git branch: 'master',
                credentialsId: '42018f3f-fd55-4d0a-8b73-7ab54bdfeec5',
                url: 'https://github.com/deepak1792/django-testing-examples.git'
                 }
            }
   
        stage('Initialisation') {
            steps {
                echo "Setting up container"
                sh 'make build'
                sh 'make run'

            }
        }

        stage('Migrations'){
          steps {
              sh 'make python-makemigration-and-migrate'
            }
          }

        stage('Test environment'){
          steps {
              sh 'make test-environment'
          }
        }

        stage('Black Test'){
          steps {
              sh 'make black-test'
          }
        }

        stage('Common security issues'){
          steps {
              sh 'make security-issue'
          }
        }

        stage('Pyflakes analyzes'){
          steps {
              sh 'make pyflakes-analyzes'
          }
        }

        stage('Unittest nosetest'){
          steps {
              sh 'make unittest-nosetest'
          }
        }

        stage('StaticCodeAnalysis'){
          steps {
            sh 'make static-code-analysis'
          }
        }

      }
    }
