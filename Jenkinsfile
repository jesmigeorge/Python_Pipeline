pipeline {
    agent any
    environment {
        REPO_NAME = "pipeline_test"
        IMAGE_NAME = "pyjenks" // This variable is not currently used in your build/push commands
        IMAGE_TAG = "1.1"
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/jesmigeorge/Python_Pipeline.git'
            }
        }

        stage('Login to DockerHub.Build and Push Docker Image From Jenkins') {
            steps {
                script { // Use a script block to ensure Groovy context for all variables
                    withCredentials([
                        usernamePassword(
                            credentialsId: 'dockerhub-creds',
                            usernameVariable: 'dockerhubUser', // Renamed for clarity
                            passwordVariable: 'dockerhubPass'   // Renamed for clarity
                        )
                    ]) {
                        // Use Groovy interpolation for all variables within bat command (double quotes)
                        bat "echo ${dockerhubPass} | docker login -u ${dockerhubUser} --password-stdin"
                        echo "Building Docker image: ${dockerhubUser}/${REPO_NAME}:${IMAGE_TAG}"
                        bat "docker build -t ${dockerhubUser}/${REPO_NAME}:${IMAGE_TAG} ."
                        bat "docker push ${dockerhubUser}/${REPO_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }
    }
}
s