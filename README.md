# Vagrant-HAProxy-KeepAlived

Deploys a minimal web app cluster with 2 web servers servers and one server with HAProxy used as load balancer.

### Tools deployed
* Web Server provided by Nginx
* HAProxy
* KeepAlived

Tools used in preparation
* Vagrant
* Ansible
* VirtualBox

### How to run:

Clone the project
```
git clone https://github.com/psamagal/vagrant-haproxy-keepalived.git
```

and finally run
```
vagrant up
```

To test it, please run:

```
./test.sh 
```
On alternative you can use the Jmeter test plan. 
It will create you and infinite loop with requests to haproxy server which allow you to perform several operations on servers, making sure app keeps always working.

You can also access to the application on your browser using

```
http://192.168.1.170 
```

to access the HAProxy stats page

```
http://192.168.1.170:9000/stats 
```

Here's our setup:

2 HaProxy Load Balancer on a Master - Slave setup.
* IP address: 192.168.1.201
* IP address: 192.168.1.202

2 Nginx Web Servers.
* IP address: 192.168.1.221
* IP address: 192.168.1.222

virtual IP address that floats between hp01 and hp02: 192.168.1.170
