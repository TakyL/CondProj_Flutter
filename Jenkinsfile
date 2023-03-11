pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'flutter packages get'
            }
        }
        stage('Test') {
            steps {
                sh 'flutter test'
            }
        }
    }
}

