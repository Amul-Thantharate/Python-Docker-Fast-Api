pipeline {
    agent any
    
    tools{
        
        jdk 'jdk17'
    }

    stages {
        stage('Git Checkout ') {
            steps {
                git branch: 'master', url: 'https://github.com/Amul-Thantharate/Python-Docker-Fast-Api.git'
                
            }
        }
        
        stage('Docker Build & Tag') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docke-cred') {
                        sh "sudo docker build -t amuldark/python-docker-fast-api ."
                    }
                }
            }
        }
        
        stage('Docker Push') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docke-cred') {
                        sh "sudo docker push amuldark/python-docker-fast-api"
                    }
                }
            }
        }
        
        stage('Docker Deploy') {
            steps {
                sh "sudo docker run -d -p 8888:80 amuldark/python-docker-fast-api"
            }
        }
        
        
    }
}