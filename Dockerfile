FROM resin/rpi-raspbian:jessie

MAINTAINER PatBriPerso <patbriperso@hotmail.com>

# Update the repository
RUN apt-get update
# Download and Install Nginx
RUN apt-get install -y nginx
# Clean unecessary files
RUN apt-get clean

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD ./conf/nginx.conf /etc/nginx/

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start
