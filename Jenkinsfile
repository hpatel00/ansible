pipeline{
 agent any

  environment {
    SSH_USR=
    SSH_PSW=
  }

  options {
    ansiColor('xterm')
  }

  stages {

    stage('Do a Dry Run') {
      steps {
        sh '''
           export ANSIBLE_ALLOW_WORLD_READABLE_TMPFILES=True
           ansible-playbook roboshop.yml -e HOST=localhost -e role_name=frontend -C
        '''
      }

    }
  }
}