pipeline {
    agent any
    environment {
        DOCKER_REPO = "jesmigeorge/pipeline_test"
        IMAGE_TAG = "pypipe_1"
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/jesmigeorge/Python_Pipeline.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${DOCKER_REPO}:${IMAGE_TAG} ."
            }
        }
        stage('Push Docker Image to DockerHub') {
            steps {
                withDockerRegistry([ credentialsId: 'docker_access_token', url: '' ]) {
                    bat "docker push ${DOCKER_REPO}:${IMAGE_TAG}"
                }
            }
        }
    }
}