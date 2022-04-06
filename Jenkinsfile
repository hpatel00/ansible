pipeline{
 agent any

  environment {
    SSH = credentials('SSH')
  }

  options {
    ansiColor('xterm')
  }

  stages {

     stage('Check Ansible Style') {
       when { branch pattern: "ROB-.*", comparator: "REGEXP"}
        steps{
            sh 'echo Ansible Style Checks'
            // will find the correct tool to check style later
        }
     }

    stage('Run Ansible in Sandbox Enviroment') {
      when { branch pattern: "PR-.*", comparator: "REGEXP"}
        steps{
            sh 'ansible-playbook roboshop-check.yml -e HOST=localhost -e ansible_user=${SSH_USR} -e ansible_password=${SSH_PSW} -e role_name=frontend -e ENV=sandbox -e CHECK_MODE=true'
        }
     }

    stage('tag') {
      when { branch 'main'}
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