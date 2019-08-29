pipeline {
    agent any

    stages {
       
        stage ('Checkout') {
           
            steps{
                git branch: 'master',
                credentialsId: '42018f3f-fd55-4d0a-8b73-7ab54bdfeec5',
                url: 'https://github.com/deepak1792/django-testing-examples.git'
                sh "ls -lat"
                 }
            }
   
        stage ('install req') {
           
            steps{
                withEnv(["HOME=${env.WORKSPACE}"]){
                sh 'python3 -m pip install django==1.11 --user'
                sh 'python3 -m pip install -r testing-requirements.txt --user'
                }
              }
            }
       
       
        stage ('Compile Stage') {
           
            steps{
                withEnv(["HOME=${env.WORKSPACE}"]){
                sh 'python3 manage.py makemigrations && python3 manage.py migrate'
                }
                 }
            }
        
        stage('Test environment') {
            steps {
                withEnv(["HOME=${env.WORKSPACE}"])
                {
                     sh 'pip3 list'
                     sh 'which pip3'
                     sh 'which python3'
                }
            }
        }

        stage ('Testing Stage') {

            steps {
                withEnv(["HOME=${env.WORKSPACE}"])
                {
                sh 'python3 manage.py test'
                sh 'python3 -Wall manage.py test'
                }
                }
            }   
        stage ('Code Coverage') {

            steps {
                withEnv(["HOME=${env.WORKSPACE}"])
                {
                sh 'coverage erase'
                sh 'coverage run manage.py test'
                sh 'coverage report'
                }
                }
            }   
    }
}
