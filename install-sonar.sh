#! /bin/bash
# Script to install Jenkins 
<<ml
     Hige level Steps
     1) create Sonar User & give admin rights
     2) install depedndencies - wget, java jdk, unzip
     3) download SonarQube
     4) change ownership & group to Sonar and set permission to 775 
     5) start sonar => sonar.sh start
ml


# Step 0: Set Hostname
sudo hostnamectl set-hostname SonarQube

# Step 1: Create Sonar User
sudo useradd sonar
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
su - sonar

# Step 2: cd to /opt install dependencies wget, unzip
cd /opt
sudo yum install wget unzip -y

# Step 3: Install Java jdk
sudo wget sudo wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo yum install jdk-8u131-linux-x64.rpm -y

# Step 4: Download Sonar & unzip & Rename
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8/ sonarqube/

# Step 5: Set ownership, group & permission for SonarQube
sudo chown -R sonar:sonar /opt/sonarqube
sudo chmod -R 775 /opt/sonarqube

# Step 6: Start SonarQube
sudo sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start