pipeline {
    agent any
    environment {
        REPO_NAME = "pipeline_test"
        IMAGE_NAME = "pyjenks"
        IMAGE_TAG = "1.1"
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/jesmigeorge/Python_Pipeline.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME%:%IMAGE_TAG% ."
            }
        }

        stage('Login and Push Docker Image to DockerHub From Jenkins') {
            steps{
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'user_name',
                        passwordVariable: 'pass'
                    )
                ]) {
                    bat "docker login -u  %user_name% -p %pass%"
                    bat "docker tag %IMAGE_NAME%:%IMAGE_TAG% %REPO_NAME%:%IMAGE_TAG%"
                    bat "docker push %REPO_NAME%:%IMAGE_TAG%"
                }
            }
        }
    }
}

