#Install docker and prepare OS
yum install -y docker
systemctl start docker 
systemctl enable docker 
usermod -aG dockerroot vagrant

# run jenkins
mkdir -p /var/jenkins_home
chown -R 1000:1000 /var/jenkins_home/
#docker load -i /tmp/jenkins_container
docker build -t jenkins-docker /home/vagrant/jenkins-docker
docker run -p 8080:8080 -p 50000:50000   -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock  -d --name jenkins jenkins-docker

#docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -d --name jenkins jenkins