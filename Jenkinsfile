node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
     }
    
     stage('Deploy image') {
          dir("deploy"){
              sshagent(credentials : ['9377ca92-2995-4ae6-8566-34304131fffd']) {
             
              sh 'git remote remove origin'
              sh 'git remote add origin git@github.com:shrnjsdud/deploy.git'
                   
              sh 'touch init'
              sh 'git add .'
              sh 'git commit -m "upgrade"'
              sh 'git push origin master'
                   
              }   
          }
     }
                   
     


 }
