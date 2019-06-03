download some packets to a distant server using ansible:

settings:
create an rsa key pair by using command line keygen
copy and paste the file id_rsa.pub which contein the public key under .ssh in the file authorized_keys.
sign in scaleway and paste the public key under credentials in the key section
connect to the instance by using ssh root@51.15.121.199 and open a new terminal for what is following


once conected to the instance:
ping the server using ansible with the command line ansible -m ping all

create a playbook:
go to /etc/ansible/roles and create a file .yml where will be located all the packets you want to send to the server.
In this case the file is skhn_common.yml
then use the following command line to execute the file .yml and make the download of packets on the server.
the command is: ansible-playbook -i hosts /etc/ansible/roles/skhn_common.yml
Packets should be downloaded.
P.S: in my case after having done the ping i add to give rights to all users by going in /etc/ansible and doing chmod 777 hosts,
i also had to add this to the file because of my python version which wasn't the good one.
