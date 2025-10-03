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

        // stage('Login to DockerHub.Build and Push Docker Image From Jenkins') {
        //     steps {
        //         script { 
        //             withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'passWord', usernameVariable: 'userName')]) 
        //             {
        //                 bat "echo ${dockerhubPass} | docker login -u ${dockerhubUser} --password-stdin"
        //                 echo "Building Docker image: ${dockerhubUser}/${REPO_NAME}:${IMAGE_TAG}"
                        
        //                 bat "docker push ${dockerhubUser}/${REPO_NAME}:${IMAGE_TAG}"
        //             }
        //         }
        //     }
        // }
    }
}
s