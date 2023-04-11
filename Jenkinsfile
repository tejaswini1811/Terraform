pipeline{
    agent{label 'JDK_17' }
    stages{
        stage('vcs'){
            git url:'https://github.com/tejaswini1811/Terraform.git',
                branch:'jenkins'
        }
        stage('terraform initialization'){
            sh 'terraform init',
                'terraform validate',
                'terrafrom fmt'
        }
        stage('terraform apply'){
            sh 'terrafrom apply -var-file var.tfvars -auto-approve'
        }
    }
}