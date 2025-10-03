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

        stage('Login to DockerHub.Build and Push Docker Image From Jenkins') {
            steps{
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'user_name',
                        passwordVariable: 'pass'
                    )
                ]) {
                    bat "docker login -u  %user_name% -p %pass%"
                    echo "%user_name%"
                    bat "docker build -t %user_name%/%REPO_NAME%:%IMAGE_TAG%"
                    bat "docker push %user_name%/%REPO_NAME%:%IMAGE_TAG%"
                }
            }
        }
    }
}

