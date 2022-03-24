node('maven-helm') {
    def tag;

    stage ('pull code') {
        sh "git clone https://github.com/edwin/hello-world-spring-boot-helm.git source "
    }
    stage ('mvn build') {
        dir("source") {

            tag = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim();

            sh "mkdir build-folder"
            sh "mkdir properties-folder"
            sh "mvn -B clean package -Dmaven.repo.local=/tmp/source/m2"

            sh "cp target/*.jar build-folder/"
            sh "cp target/classes/*.properties properties-folder/"
        }
    }
    stage ('build and push') {
        dir("source") {
            sh "oc new-build .  \
                        --name=hello-world-spring-boot-helm \
                        --image-stream=openshift/openjdk-11-rhel8:1.0  || true"
            sh "oc start-build hello-world-spring-boot-helm --from-dir=build-folder/. --follow --wait "
            sh "oc tag cicd/hello-world-spring-boot-helm:latest ns-dev/hello-world-spring-boot-helm:${BUILD_NUMBER} "

            sh "oc project ns-dev"
            sh "oc create configmap hello-world-spring-boot-helm-${BUILD_NUMBER}-configs --from-file=properties-folder/  || true "

            sh "sed  -i -e 's/APP_VERSION/1.${BUILD_NUMBER}-${tag}/g' Chart.yaml "

            sh "helm upgrade --install hello-world-spring-boot-helm . --set tag=${BUILD_NUMBER} --set env=dev --set gitCommit=${tag}"
        }
    }
}