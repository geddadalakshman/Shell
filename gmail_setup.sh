#!/bin/bash
sudo su -

#Update yum repo excluding kernel updates
yum update -y --exclude=kernel*

#Install Postfix, the SASL authentication framework, and mailx.
yum -y install postfix cyrus-sasl-plain mailx

systemctl restart postfix

systemctl enable postfix

#Open the /etc/postfix/main.cf file.
vi /etc/postfix/main.cf
#append the following into the file at the end the file
relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous
smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt

#Add the Gmail credentials for authentication. Create a "/etc/postfix/sasl_passwd" file
touch /etc/postfix/sasl_passwd

vi /etc/postfix/sasl_passwd
#Add the following line to the file:
[smtp.gmail.com]:587 xyz:AppPassword

#Create a Postfix lookup table from the sasl_passwd text file by running the following command:
postmap /etc/postfix/sasl_passwd

#Sending mail Run the following command to send mail:
echo "This is a test mail & Date $(date)" | mail -s "message" info@joindevops.com