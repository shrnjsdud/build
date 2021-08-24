node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
         app = docker.build("nky/hello")
     }
    
     stage('Deploy image') {
          dir("deploy"){
              sshagent(credentials : ['9377ca92-2995-4ae6-8566-34304131fffd']) {
              sh 'touch init'
              sh 'git commit -a -m "upgrade"'
              sh 'git push'
                   
              }  
          }
     }
                   
     


 }
