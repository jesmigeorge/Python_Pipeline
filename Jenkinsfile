pipeline {
    agent any
    environment {
        DOCKER_REPO = "jesmigeorge/pipeline_test"
        DOCKER_IMAGE = "pypipe"
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
                bat "docker build -t ${DOCKER_IMAGE}:${IMAGE_TAG} ."
            }
        }
        
        stage('Push Docker Image to DockerHub Registry') {
            steps {
                withDockerRegistry(credentialsId: '001a578f-c348-42ec-95a2-ef6cb053f9c9', toolName: 'docker') {
                    bat "docker push ${DOCKER_REPO}/${DOCKER_IMAGE}:${IMAGE_TAG}"
                }
            }
        }
    }
}