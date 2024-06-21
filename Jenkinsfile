pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                git branch: 'main', url: 'https://github.com/lidrous/mynginx'
            }
        }
        stage('Deploy') {
            steps {
                // Deploy to production server
                sshagent(credentials: ['my-ssh-key']) {
                    sh '''
                    # Variables
                    PROD_SERVER="192.168.100.67"
                    DEPLOY_DIR="/var/www/html"
                    USER="lidrous"
                    
                    # Ensure the target directory exists
                    ssh -o StrictHostKeyChecking=no $USER@$PROD_SERVER "sudo mkdir -p $DEPLOY_DIR"

                    # Copy the files to the deploy directory
                    scp -o StrictHostKeyChecking=no -r * $USER@$PROD_SERVER:$DEPLOY_DIR

                    # Restart Nginx to apply changes
                    ssh -o StrictHostKeyChecking=no $USER@$PROD_SERVER "sudo systemctl restart nginx"
                    '''
                }
            }
        }
    }
}

