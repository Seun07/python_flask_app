pipeline {


    agent any
    stages {
        
        stage("GitHub checkout....") {
            steps {
                script {
 
                    git branch: 'main', url: 'https://github.com/Seun07/python_flask_app.git' 
                }
            }
        }
        stage("Build docker connecting....."){
            steps{
                sh 'printenv'
                sh 'git version'
                sh 'docker build . -t seun0706/f-app1.1'
            }
        }

        stage("push image to DockerHub"){

            steps{


                script {

                
                  
                 withCredentials([string(credentialsId: 'ACCESSID', variable: 'ACCESSID')]) {

                    sh 'docker login -u seun0706 -p ${ACCESSID}'
                }
                    sh 'docker push seun0706/f-app1.1:latest'
                }
            }
        }
        stage('Deploying python app to Kubernetes') {


            steps {

                script {

                    dir('kubernetes') {

                        sh ('aws eks update-kubeconfig --name eks-cluster-207 --region eu-north-1')
                        sh 'kubectl config current-context'
                        //sh "kubectl get ns"
                        sh "kubectl apply -f deployment-eks.yaml"
                        sh "kubectl apply -f service-eks.yaml"
                    }
      

                }
            }
        }
    }
}