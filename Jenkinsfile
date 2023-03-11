pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build apk'
            }
        }
        
        stage('Test') {
            steps {
                sh 'flutter test'
            }
        }
        
        stage('Deploy') {
            steps {
                // Add deployment steps here
            }
        }
    }
}
