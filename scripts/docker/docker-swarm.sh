#!/bin/bash

#
# This script demonstrates the basic usage of Docker Swarm.
#
# Author: Marcos Silvestrini
# Date: 2024-05-27
#

# Function to print a colored message
function print_message() {
    local color=$1
    local message=$2
    echo -e "\e[${color}m${message}\e[0m"
}

# Function to wait for user to press Enter
function press_enter() {
    read -p "Press Enter to continue..."
}

# Function to display the main menu
function show_menu() {
    clear
    print_message "36" "============================================="
    print_message "36" "      Docker Swarm Lab Menu"
    print_message "36" "============================================="
    print_message "32" "1. Initialize Swarm"
    print_message "32" "2. Deploy WordPress Stack"
    print_message "32" "3. Scale WordPress Service"
    print_message "32" "4. Update WordPress Service"
    print_message "32" "5. Inspect Service"
    print_message "32" "6. View Service Logs"
    print_message "32" "7. Remove WordPress Stack"
    print_message "31" "8. Teardown (Leave Swarm)"
    print_message "31" "9. Exit"
    print_message "36" "============================================="
}

# Function to initialize the swarm
function init_swarm() {
    print_message "33" "Initializing Docker Swarm..."
    docker swarm init --advertise-addr $(hostname -i)
    press_enter
}

# Function to deploy the WordPress stack
function deploy_stack() {
    read -p "Enter the IP address for WORDPRESS_HOME and WORDPRESS_SITEURL (e.g., http://192.168.0.131:8080): " wordpress_url

    print_message "33" "Creating nginx.conf..."
    cat << 'EOF' > nginx.conf
worker_processes 1;
events {}

http {
    upstream wordpress_servers {
        server wordpress:80;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://wordpress_servers;
            proxy_set_header Host $http_host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
}
EOF

    print_message "33" "Deploying WordPress Stack..."
    cat << EOF > docker-compose.yml
version: '3.8'
services:
  nginx:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    networks:
      - wordpress-network
    depends_on:
      - wordpress

  wordpress:
    image: wordpress:latest
    volumes:
      - wordpress-html:/var/www/html
    environment:
      WORDPRESS_DB_HOST: mariadb
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: mypassword
      WORDPRESS_DB_NAME: wordpress
      WORDPRESS_HOME: ${wordpress_url}
      WORDPRESS_SITEURL: ${wordpress_url}
    networks:
      - wordpress-network
    depends_on:
      - mariadb
    deploy:
      replicas: 2

  mariadb:
    image: mariadb:latest
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: mypassword
    volumes:
      - dbdata:/var/lib/mysql
    networks:
      - wordpress-network

networks:
  wordpress-network:

volumes:
  wordpress-html:
  dbdata:
EOF
    docker stack deploy -c docker-compose.yml wordpress
    press_enter
}

# Function to scale the WordPress service
function scale_service() {
    read -p "Enter the number of replicas for WordPress service: " replicas
    print_message "33" "Scaling WordPress service to ${replicas} replicas..."
    docker service scale wordpress_wordpress=${replicas}
    press_enter
}

# Function to update the WordPress service
function update_service() {
    read -p "Enter the new WordPress image version (e.g., wordpress:latest): " new_version
    print_message "33" "Updating WordPress service to ${new_version}..."
    docker service update --image ${new_version} wordpress_wordpress
    press_enter
}

# Function to inspect the service
function inspect_service() {
    print_message "33" "Inspecting wordpress_wordpress service..."
    docker service ps wordpress_wordpress
    press_enter
}

# Function to view service logs
function view_logs() {
    print_message "33" "Which service logs do you want to see?"
    print_message "32" "1. nginx"
    print_message "32" "2. wordpress"
    print_message "32" "3. mariadb"
    read -p "Choose an option [1-3]: " log_choice
    case $log_choice in
        1)
            docker service logs wordpress_nginx
            ;;
        2)
            docker service logs wordpress_wordpress
            ;;
        3)
            docker service logs wordpress_mariadb
            ;;
        *)
            print_message "31" "Invalid option."
            ;;
    esac
    press_enter
}


# Function to remove the WordPress stack
function remove_stack() {
    print_message "33" "Removing WordPress Stack..."
    docker stack rm wordpress
    rm docker-compose.yml nginx.conf
    press_enter
}

# Function for teardown (leave the swarm)
function teardown() {
    print_message "31" "Leaving the swarm..."
    docker swarm leave --force
    press_enter
}

# Main loop
while true; do
    show_menu
    read -p "Choose an option [1-9]: " choice
    case $choice in
        1)
            init_swarm
            ;;
        2)
            deploy_stack
            ;;
        3)
            scale_service
            ;;
        4)
            update_service
            ;;
        5)
            inspect_service
            ;;
        6)
            view_logs
            ;;
        7)
            remove_stack
            ;;
        8)
            teardown
            ;;
        9)
            print_message "32" "Exiting."
            exit 0
            ;;
        *)
            print_message "31" "Invalid option. Please try again."
            press_enter
            ;;
    esac
done
