node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
         app = docker.build("nky/hello")
     }
     stage('Push image') {
         docker.withRegistry('https://repo.nky.wjcloud.co.kr', 'harbor') {
             app.push("${env.BUILD_NUMBER}")
             app.push("latest")
         }
     }
     stage('Deploy image') {
          
          sh 'pwd'
          sh 'kubectl --kubeconfig=/var/lib/jenkins/config  get svc' 
          sh 'cd ./deploy && kustomize edit set image repo.nky.wjcloud.co.kr/nky/hello:$BUILD_NUMBER'
          sh 'cd ./deploy && kustomize build >> deploy.yaml'
          sh 'git add .'
          sh 'git status'
          sh 'git commit -m "update"'    
                
          withCredentials([usernamePassword(credentialsId: '91c7f389-bc08-40ca-b1d7-9e4a098353c0',
                 usernameVariable: 'username',
                 passwordVariable: 'password')]){
               sh ('git push https://${username}:${password}@github.com/shrnjsdud/nky.git master')
           }
        

                   
     }


 }
