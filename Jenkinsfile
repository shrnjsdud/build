node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
         app = docker.build("hello")
     }
     stage('Push image') {
         docker.withRegistry('https://repo.nky.wjcloud.co.kr/nky', 'harbor') {
             app.push("${env.BUILD_NUMBER}")
             app.push("latest")
         }
     }
 }
