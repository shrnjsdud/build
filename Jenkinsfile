node {
    
     def VERSION = '2.0'
        
    
     
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
          app = docker.build("nky/hello")
     }
     
     stage('Push image') {
         docker.withRegistry('https://repo.nky.wjcloud.co.kr', 'harbor') {
             app.push("${VERSION}")
             app.push("latest")
         }
     }
     stage('Deploy image') {
          sh 'rm -rf deploy'
          sh 'git clone https://github.com/shrnjsdud/deploy.git'
          dir("deploy"){
              sshagent(credentials : ['jenkins_github_ssh']) {
              sh 'git remote show'
              sh 'git remote remove origin'
              sh 'git remote add origin git@github.com:shrnjsdud/deploy.git'
              sh 'cd overlays/dev && kustomize edit set image repo.nky.wjcloud.co.kr/nky/hello:${VERSION}'
              sh 'cd overlays/dev && kustomize build > ../../deploy.yaml'
              sh 'git add .'
              sh 'git status'
              sh 'git commit -m "deploy"'
              sh 'git push origin master' 
                   
              }   
                
          }
         
     }
                   
     


 }
