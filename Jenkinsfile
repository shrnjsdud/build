node {
     environment {
        VERSION = '1.0'
        
    }
     
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
          app = docker.build("nky/hello")
     }
     
     stage('Push image') {
         docker.withRegistry('https://repo.nky.wjcloud.co.kr', 'harbor') {
             app.push("${env.VERSION}")
             app.push("latest")
         }
     }
     stage('Deploy image') {
          sh 'rm -rf deploy'
          sh 'git clone https://github.com/shrnjsdud/deploy.git'
          dir("deploy"){
              sshagent(credentials : ['9377ca92-2995-4ae6-8566-34304131fffd']) {
              sh 'git remote show'
              sh 'git remote remove origin'
              sh 'git remote add origin git@github.com:shrnjsdud/deploy.git'
              sh 'cd overlays/dev && kustomize edit set image repo.nky.wjcloud.co.kr/nky/hello:${env.VERSION}'
              sh 'cd overlays/dev && kustomize build > ../../deploy.yaml'
              sh 'git add .'
              sh 'git commit -m "upgrade"'
              sh 'git push origin master' 
                   
              }   
               
          }
         
     }
                   
     


 }
