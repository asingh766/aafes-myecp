pipeline {
  agent none
//   environment {
//     CREDENTIALS_ID =credentials('79691a13-c7fc-4bf5-a91c-4792427a60a1')
//     BUCKET = 'jenkins-artifacts'
//     REPO_LOCATION= "us-central1"
//     PROJECT = "AAFES-MyECP"
//     REPO_NAME = "jenkins"
//     APP_NAME ="flutterflow-webapp"
//     IMAGE_NAME = "${REPO_LOCATION}-docker.pkg.dev/${PROJECT}/${REPO_NAME}/${APP_NAME}"
//     }
  stages {
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t flutterv3 .'
      }
    }
    stage('Push image') {
      agent any
      environment {
        CREDENTIALS_ID =credentials('79691a13-c7fc-4bf5-a91c-4792427a60a1')
        }
      steps{
        script {
          withCredentials([file(credentialsId: ${CREDENTIALS_ID},variable: 'GC_KEY')]){
            sh "gcloud auth activate-service-account --key-file=${GC_KEY}"
            sh 'cat "${$GC_KEY}" | docker login -u _json_key_base64 --password-stdin https://"us-central1-docker.pkg.dev/aafes-myecp/jenkins'
            sh 'docker push ${IMAGE_NAME}:latest'
            sh 'docker logout https://"${REPO_LOCATION}"-docker.pkg.dev'
         } 
        }
      }
    } 
  }
}