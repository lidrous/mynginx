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
                sshagent(credentials: ['my-ssh-key']) { // Use the ID you provided
                    sh '''
                    # Variables
                    DEPLOY_DIR="/var/www/html"
                    
                    # Copy the files to the deploy directory
                    sudo cp -r * $DEPLOY_DIR

                    # Restart Nginx to apply changes
                    sudo systemctl restart nginx
                    '''
                }
            }
        }
    }
}
