pipeline {
    agent any
    environment{
     registry = "900024488048.dkr.ecr.ap-south-1.amazonaws.com"
    }
    stages {
        stage('Clone WordPress Repository') {
            steps {
            git 'https://github.com/sravanidevi3/wordpress.git'
            }
        }
        stage('Building Docker Stack'){
            steps{
                sh 'docker system prune -af'
                sh 'docker -v'
                script{
                docker.withRegistry("https://"+registry, "ecr:ap-south-1:wordpress") {
                    def customImage = docker.build(registry+"/clevertap:wordpress_${BUILD_NUMBER}")            
                     customImage.push()
                }
                }
            }
            
        }
        stage('Deploying to Fargate'){
            steps{
                sh 'cd terraform && terraform init && terraform validate  && terraform apply -var="tag=wordpress_${BUILD_NUMBER}" -auto-approve'
            }
        }
    }
}
