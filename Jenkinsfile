pipeline {
    agent any

    environment {
        // Credentials ID from AWS Credentials Plugin
        AWS_ACCESS_KEY_ID = credentials('access-key')
        AWS_SECRET_ACCESS_KEY = credentials('secret-key')
        ECR_REPOSITORY_URI= 'public.ecr.aws/m9e9t7m6/omar'
        AWS_REGION = 'ca-central-1'
    }

    stages {
         stage('Build Docker Image front') {
             steps {
               
                 sh 'docker build -t ${ECR_REPOSITORY_URI}/omar:${BUILD_NUMBER} ./app/frontend/.'
                 sh 'aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPOSITORY_URI}'
                 sh 'docker push ${ECR_REPOSITORY_URI}/omar:${BUILD_NUMBER}'
             }
         }
         stage('Build Docker Image back') {
             steps {
                 sh 'docker build -t ${ECR_REPOSITORY_URI}/omar:${BUILD_NUMBER} ./app/backend/.'
                 sh 'aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPOSITORY_URI}'
                 sh 'docker push ${ECR_REPOSITORY_URI}/omar:${BUILD_NUMBER}'
             }
         }
         stage('Kubernetes Edit Files') {
             steps {
                    sh "sed -i 's|image:.*|image: ${ECR_REPOSITORY_URI}/omar:${BUILD_NUMBER}|g' ./k8s/backend.yml"
                    sh "sed -i 's|image:.*|image: ${ECR_REPOSITORY_URI}/omar:${BUILD_NUMBER}|g' ./k8s/frontend.yml"
                      sh "aws eks update-kubeconfig --region ca-central-1 --name master-eks "
             }
        }

        
        stage('apply database') {
            steps {
                
                 
                 sh 'kubectl apply -f ./k8s/mongo-scret.yml '
                 sh 'kubectl apply -f ./k8s/mongo-sc.yml '  
                 sh 'kubectl apply -f ./k8s/mongo-pvc.yml '
                 sh 'kubectl apply -f ./k8s/mongo.yml '
                 sh 'kubectl apply -f ./k8s/network-policy.yml '
            }
        }

        stage('apply backend') {
            steps {
                  sh 'kubectl apply -f ./k8s/backend.yml '  
                  sh 'kubectl apply -f ./k8s/backend-svc.yml '  
            }
        }

        stage('apply frontend') {
            steps {
                sh 'kubectl apply -f ./k8s/frontend.yml '  
                sh 'kubectl apply -f ./k8s/frontend-svc.yml '  
            }
        }

    }
}
