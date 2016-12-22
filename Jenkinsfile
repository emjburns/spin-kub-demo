#!groovy
node('umaas_build_slave') {
  //todo: correct slave
  withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'surf-service-account',
          usernameVariable: 'SERVICE_USERNAME', passwordVariable: 'SERVICE_PASSWORD']]) {
      stage ('Stage Checkout')
           checkout([$class: 'GitSCM',
                     branches: [[name: '*/master']],
                     doGenerateSubmoduleConfigurations: false,
                     extensions: [],
                     submoduleCfg: [],
                     userRemoteConfigs: [[credentialsId: 'surf-service-account', url: 'https://stash.veritas.com/scm/surf/spin-kub-demo.git']]])

      stage ('Build')
       //  build in docker image
         sh '''
           export HOME=/root
           docker build -t "artifactory-surf-auto-images-stable.cto.veritas.com/spin-kub-demo:${BUILD_NUMBER}" .
         '''

      stage ('Push docker image')
         sh '''
           export HOME=/root
           docker login -u "${SERVICE_USERNAME}" -p "${SERVICE_PASSWORD}" --email="noreply@veritas.com" artifactory-surf-auto-images-stable.cto.veritas.com
           docker push "artifactory-surf-auto-images-stable.cto.veritas.com/spin-kub-demo:${BUILD_NUMBER}"
         '''
  }
}
