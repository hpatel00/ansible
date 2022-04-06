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

    stage('Tag') {
      when { branch 'main' }
        steps {
            sh '''
               env
               bash -x sort_git_tags.sh
            '''
        }
    }
  }
}
