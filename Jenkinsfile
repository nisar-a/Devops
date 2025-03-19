pipeline {
    agent any

    environment {
        IMAGE_NAME = "sivagurunathan7/test_repository"
        TAG = "latest"
        CONTAINER_NAME = "my-container"
        PORT = "3001"
    }

    stages {
        
        stage('Clone Repository') {
            steps {
                echo "Cloning GitHub repository..."
                git 'https://github.com/Sivagurunathan98/New_docker_push.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                bat 'powershell.exe -Command "Set-ExecutionPolicy RemoteSigned -Force"'
                bat 'powershell.exe -File .\\Build.ps1'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                echo "Logging into Docker Hub..."
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat 'echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker image to Docker Hub..."
                bat "docker tag %IMAGE_NAME%:%TAG% %IMAGE_NAME%:%TAG%"
                bat "docker push %IMAGE_NAME%:%TAG%"
            }
        }

        stage('Deploy Docker Container') {
            steps {
                echo "Deploying Docker container..."
                bat 'powershell.exe -File .\\Deploy.ps1'
            }
        }
    }

    post {
        success {
            echo "Deployment Successful!"
        }
        failure {
            echo "Deployment Failed!"
        }
    }
}
