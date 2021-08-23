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
          sh 'git add .'
          sh 'git commit -a -m "test 7"'
          sh 'git push origin shrnjsdud/nky'
         
       
          sh 'git push'
        

                   
     }


 }
