pipeline{
 agent any

  environment {
    SSH = credentials('SSH')
  }

  options {
    ansiColor('xterm')
  }

  stages {

    stage('Do a Dry Run') {
      steps {
        sh '''
           ansible-playbook roboshop-check.yml -e HOST=localhost -e ansible_user={$SSH_USR} -e ansible_password={$SSH_PSW} -e role_name=frontend -e ENV=sandbox
        '''
      }

    }
  }
}