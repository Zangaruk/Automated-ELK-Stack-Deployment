# Project_1
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Cloud Diagram](https://github.com/Zangaruk/Project_1/blob/main/diagrams/Cloud_Diagram.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  The link below takes you to the playbook that will help setup your ansible. This would be your first step.
  
  [ansible-playbook.yml](https://github.com/Zangaruk/Project_1/blob/main/ansible/ansible-playbook.yml)
  
  The link below takes you to the playbook that will help setup you elk container. This would be your second step.
  
  [install-elk.yml](https://github.com/Zangaruk/Project_1/blob/main/ansible/install-elk.yml)
  
  The link below takes you to the playblook that will help setup your filebeat which should be ran after your elk server is set along with the config file.
 
  [filebeat-playbook.yml](https://github.com/Zangaruk/Project_1/blob/main/ansible/filebeat-playbook.yml)
 
  [filebeat_config.yml](https://github.com/Zangaruk/Project_1/blob/main/ansible/filebeat_config.yml)

  The link below takes you to the playblook that will help setup your metricbeat which should be ran after your elk server is set along with the config file.
 
  [metricbeat-playbook.yml](https://github.com/Zangaruk/Project_1/blob/main/ansible/metricbeat-playbook.yml)
 
  [metricbeat_config.yml](https://github.com/Zangaruk/Project_1/blob/main/ansible/metricbeat_config.yml)
    
   *note metricbeat and filebeat have to be ran after the elk server is set and playbook is ran, but they can be ran in either order (filebeat then metricbeat or 
   metricbeat then filebeat) you also want both of these config files.*

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the metrics and system logs.

The configuration details of each machine may be found below.

| Name       | Function   | IP Address | Operating System |
|------------|------------|------------|------------------|
| Jumpbox    | Gateway    | 10.0.0.4   | Linux            |
| ELK-SERVER | Monitoring | 10.1.0.4   | Linux            |
| Web1       | Website    | 10.0.0.5   | Linux            |
| Web2       | Redundancy | 10.0.0.6   | Linux            |
| Web3       | Redundancy | 10.0.0.7   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: <Host machines IP>

Machines within the network can only be accessed by you the user via the Jumpbox: <10.0.0.4>

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Addresses |
|------------|---------------------|----------------------|
| Jumpbox    | no                  | Host Machines Pub IP |
| ELK-SERVER | no                  | Host Machines Pub IP |
| Web1       | no                  | Host Machines Pub IP |
| Web2       | no                  | Host Machines Pub IP |
| Web3       | no                  | Host Machines Pub IP |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- It remove the margin of human error.

The playbook implements the following tasks:
1. Install docker.io
2. Install pip3, and python
3. Increase allowed memory
4. Download and launch a docker "elk" container
5. Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
[Docker PS image](https://github.com/Zangaruk/Project_1/blob/main/diagrams/ELK_Container.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Your web(s) server Ex. 10.0.0.5
                       10.0.0.6
                       10.0.0.7

We have installed the following Beats on these machines: Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
Filebeasts collects log events.
Metricbeats monitors operating systems metrics, and system services.
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

- _Which file is the playbook? Where do you copy it?_
    *Answer: Copy the Elk_install.yml file to /etc/ansible on you Jumpbox.

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
    *Answer: Update the you Elk_install.yml to include your remote_user and host name from the ansible.cfg

- _Which URL do you navigate to in order to check that the ELK server is running?
    *Answer: First run the playbook ansible-playbook Elk_install.yml http://<ELK-SERVER's pub IP>:5601*
