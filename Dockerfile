# base images
From fedora

# command to run
Label Engineer maintainer="Elie Tachenko"
Label description "my first Dockerfile installs and manages apache webserver"

# update package or command to run
Run yum -y update
# install httpd
Run  yum install -y httpd

# copy the index.html file to the container in specified location
Copy index.html /var/www/html/

# place to add systemctl start and systemctl enable
EXPOSE 80

# start container with httpd and this is the command to start httpd

ENTRYPOINT ["/usr/sbin/httpd"]

CMD ["-D", "FOREGROUND"]
