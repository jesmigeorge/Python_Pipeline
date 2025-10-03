pipeline {
    agent any
    environment {
        REPO_NAME = "pypipe"
        IMAGE_NAME = "pyjenks"
        IMAGE_TAG = "latest"
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
                    bat "docker login -u  %user_name% --password-stdin"
                    bat "docker tag %IMAGE_NAME%:%IMAGE_TAG% %user_name%/%REPO_NAME%:%IMAGE_TAG%"
                    bat "docker push %user_name%/%IMAGE_NAME%:%IMAGE_TAG%"
                }
            }
        }
    }
}
