pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh './gradlew build'
            }
        }

            stage('Clover Coverage') {
                steps {
                // Run Clover coverage recording
                sh './gradlew cloverGenerate'

                // Archive the Clover XML report
                archiveArtifacts 'build/reports/clover/clover.xml'

                // Publish the Clover HTML report
                step([$class: 'CloverPublisher', cloverReportDir: 'build/reports/clover', cloverReportFileNamePattern: 'clover.xml'])
        

                }
            }
    }
}
