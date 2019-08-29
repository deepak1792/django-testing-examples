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
   
        stage ('Install requirements') {
           
            steps{
                withEnv(["HOME=${env.WORKSPACE}"]){
                sh 'python3 -m pip install django==1.11 --user'
                sh 'python3 -m pip install -r testing-requirements.txt --user'
                }
              }
            }
       
        
       
        stage ('Migrate database') {
           
            steps{
                withEnv(["HOME=${env.WORKSPACE}"]){ 
                sh 'python3 manage.py makemigrations && python manage.py migrate'
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

        stage ('Test') {

            steps {
                withEnv(["HOME=${env.WORKSPACE}"])
                {
                sh 'python3 manage.py test'
                sh 'python3 -m pytest -s --cov=. --cov-report=html'
                }
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/django_another/htmlcov', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                }
            }
    }
}
