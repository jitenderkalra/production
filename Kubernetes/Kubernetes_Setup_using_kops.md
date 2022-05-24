Setup Kubernetes (K8s) Cluster on AWS
Create Ubuntu EC2 instance

install AWSCLI

 curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip
 sudo apt update
 sudo apt install unzip python
 unzip awscli-bundle.zip
 #sudo apt-get install unzip - if you dont have unzip in your system
 ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
 
Install kubectl on ubuntu instance

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
 chmod +x ./kubectl
 sudo mv ./kubectl /usr/local/bin/kubectl
Install kops on ubuntu instance

 curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
 chmod +x kops-linux-amd64
 sudo mv kops-linux-amd64 /usr/local/bin/kops
Create an IAM user/role with Route53, EC2, IAM and S3 full access

Attach IAM role to ubuntu instance

# Note: If you create IAM user with programmatic access then provide Access keys. Otherwise region information is enough
aws configure
Create a Route53 private hosted zone (you can create Public hosted zone if you have a domain)

Routeh53 --> hosted zones --> created hosted zone  
Domain Name: valaxy.net
Type: Private hosted zone for Amzon VPC
create an S3 bucket

 aws s3 mb s3://demo.k8s.valaxy.net
Expose environment variable:

 export KOPS_STATE_STORE=s3://demo.k8s.valaxy.net
Create sshkeys before creating cluster

 ssh-keygen
Create kubernetes cluster definitions on S3 bucket

kops create cluster --cloud=aws --zones=us-east-1 --name=Kubernetesworkshop
If you wish to update the cluster worker node sizes use below command

kops edit ig --name=CHANGE_TO_CLUSTER_NAME nodes
Create kubernetes cluser

kops update cluster Kubernetesworkshop --yes
Validate your cluster

 kops validate cluster
To list nodes

kubectl get nodes

To delete cluster

kops delete cluster Kubernetesworkshop --yes
Deploying Nginx pods on Kubernetes
Deploying Nginx Container

kubectl create deploy sample-nginx --image=nginx --replicas=2 --port=80
# kubectl deploy simple-devops-project --image=notejam:1.0 --replicas=2 --port=8080
kubectl get all
kubectl get pod
Expose the deployment as service. This will create an ELB in front of those 2 containers and allow us to publicly access them.

kubectl expose deployment sample-nginx --port=80 --type=LoadBalancer
# kubectl expose deployment simple-devops-project --port=8080 --type=LoadBalancer
kubectl get services -o wide
