Integrating Kubernetes cluster with Ansible
Login to ansible server and copy public key onto kubernetes cluseter master account

Update hosts file with new group called kubernetes and add kubernetes master in that.

Create ansible playbooks to create deployment and services

Check for pods, deployments and services on kubernetes master

kubectl get pods -o wide 
kubectl get deploy -o wide
kubectl get service -o wide
Access application suing service IP

wget <kubernetes-Master-IP>:31200
