pipeline {
  agent any
  stages {
    stage('Install dependencies') {
      steps {
        sh "chmod +x install_scripts/install_scripts.sh"
        sh "install_scripts/install_scripts.sh"
      }
    }
    
    stage('Run eks') {
      steps {
        sh "chmod +x Jenkins-k8s/script.sh"
        sh "Jenkins-k8s/script.sh"
      }
    }   
  }
}
