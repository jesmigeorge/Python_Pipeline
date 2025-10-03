pipeline {
    agent any
    environment {
        IMAGE_NAME = "pyjenksImg"
        IMAGE_TAG = "latest"
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/jesmigeorge/Python_Pipeline.git'
            }
        }
        
        stage('Build and Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker_access_token', url: '']) {
                    bat "docker build -t ${DOCKER_REPO}:${IMAGE_TAG} ."
                    bat "docker push ${DOCKER_REPO}:${IMAGE_TAG}"
                }
            }
        }
    }
}
