pipeline {
    agent any 

    environment {
        PYTHON_PATH = "C:\\Users\\jirap\\AppData\\Local\\Python\\pythoncore-3.14-64"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Jiraphonqualityassurance/TTB.git'
            }
        }

        stage('Run Web Automation Test') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    bat """
                        set PATH=%PYTHON_PATH%;%PYTHON_PATH%\\Scripts;%PATH%
                        robot --outputdir Results/Web TestCases/2.Website.robot
                    """
                }
            }
        }

        stage('Run API Automation Test') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    bat """
                        set PATH=%PYTHON_PATH%;%PYTHON_PATH%\\Scripts;%PATH%
                        robot --outputdir Results/API TestCases/3.Api.robot
                    """
                }
            }
        }

        stage('Run Mobile Automation Test') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    bat """
                        set PATH=%PYTHON_PATH%;%PYTHON_PATH%\\Scripts;%PATH%
                        robot --outputdir Results/Mobile TestCases/4.Mobile.robot
                    """
                }
            }
        }
    }

    post {
        always {
            
            junit testResults: 'Results/**/output.xml', allowEmptyResults: true
            
       
            archiveArtifacts artifacts: 'Results/**/*.html', allowEmptyArchive: true
        }
    }
}