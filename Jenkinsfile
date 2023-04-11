pipeline{
    agent{label 'JDK_17' }
    stages{
        stage('vcs'){
            steps{           
             git url:'https://github.com/tejaswini1811/Terraform.git',
                branch:'jenkins'
                }
        }
        stage('terraform initialization'){
            steps{
             sh 'terraform init'
              sh  'terraform validate'
               sh 'terraform fmt'
            }

        }
        stage('terraform apply'){
            steps{
              sh 'terraform apply -var-file var.tfvars -auto-approve' 
            }
        }
    }
}