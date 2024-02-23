!/bin/bash
yum install httpd -y
systemctl restart httpd.service
systemctl enable httpd.service
