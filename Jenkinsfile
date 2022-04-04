pipeline{
 agent any

  environment {
    SSH = credentials('SSH')
  }

  options {
    ansiColor('xterm')
  }

  stages {

     stage('Only Branch') {
       when { branch pattern: "ROB-.*", comparator: "REGEXP"}
        steps{
            sh 'env'
            sh 'echo Only Branch'
        }
     }

    stage('PR ') {
      when { branch pattern: "PR-.*", comparator: "REGEXP"}
        steps{
            sh 'env'
            sh 'echo PR'
        }
     }

    stage('Main Branch') {
        steps{
            sh 'env'
            sh 'echo Main Branch'
        }
     }
  }
}




// // We're hardcoding frontend here, but if you want to parse the previous commit for what files have been changed use the command below:
// // git diff HEAD@{1} --name-only | grep roles | awk -F / '{print $2}'
//     stage('Do a Dry Run') {
//       steps {
//         sh '''
//            ansible-playbook roboshop-check.yml -e HOST=localhost -e ansible_user=${SSH_USR} -e ansible_password=${SSH_PSW} -e role_name=frontend -e ENV=sandbox -e CHECK_MODE=true
//         '''
//       }