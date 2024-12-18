#CONTINUOUS INTEGRATION 

pipeline {
    agent any
    
    tools {
        jdk 'jdk11'
        maven 'maven3'
    }
    
    environment {
        SCANNER_HOME= tool 'sonar-scanner'
    }
    stages {
        stage('Github fetch') {
            steps {
                git 'https://github.com/ariharasudhanr/online-shopping.git'
            }
        }
        stage('Maven Complie') {
            steps {
                sh "mvn clean compile"
            }
        }
        stage('SonarQube Analysis') {
            steps {
                sh ''' $SCANNER_HOME/bin/sonar-scanner \
                -Dsonar.url=http://13.232.216.248:9000/ \
                -Dsonar.login=squ_646b944e22790c655e8df136fbe63227b3aca8cb \
                -Dsonar.projectName=shopping-cart \
                -Dsonar.java.binaries=. \
                -Dsonar.projectKey=online-shop '''
            }
        }
        stage('OWASP Dependency Check') {
            steps {
                dependencyCheck additionalArguments: ' --scan ./', odcInstallation: 'DP'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        stage('Maven Build Application') {
            steps {
                sh "mvn clean install -DskipTests=true"
            }
        }
        stage('Build & Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'Dockerhub', toolName: 'docker') {
                        sh "docker build -t shopping:latest -f docker/Dockerfile ."
                        sh "docker tag shopping:latest ariharasudhanr/shopping:latest"
                        sh "docker push ariharasudhanr/shopping:latest"
                    }
                }
            }
        }
        stage('Trigger cd_pipeline') {
            steps {
                build job: "cd_pipeline" , wait: true
            }
        }      
        
    }
}


#CONTINUOUS DEPLOYMENT

pipeline {
    agent any

    stages {
        stage('CD Pipeline for Docker Container Deploy') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'Dockerhub', toolName: 'docker') {
                        sh "docker run -d --name online-shopping-cart -p 8070:8070 ariharasudhanr/shopping:latest"
                    }
                }
            }
        }
    }
}
