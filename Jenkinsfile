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

        stage('Build Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'passWord', usernameVariable: 'userName')]) 
                    {
                        bat "docker build -t %userName%/%REPO_NAME%:%IMAGE_TAG% ."
                    }
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'passWord', usernameVariable: 'userName')]) 
                    {
                        bat "echo %passWord% | docker login -u %userName% --password-stdin"
                        bat "docker push %userName%/%REPO_NAME%:%IMAGE_TAG%"
                    }
                }
            }
        }
    }
}
s