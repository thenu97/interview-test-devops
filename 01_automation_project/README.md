# Automation Test

## Brief
Using a tool of your choice such as Bash, Chef, Ansible or similar automate the installation of a Web Server serving up some static content. Bonus points for the following:

* Using Containers as part of your automation.
* Providing a Vagrantfile to allow us to test your code by simply running `vagrant up`.

## Solution
My solution was to create a kubernetes cluster of 1 master and 1 worker, having 3 replica pods which was running the latest nginx image from docker hub. 

## Rolling Changes


## Improvements
+ combine vagrant file to provision both master and worker with one `vagrant up`
+ find a way to better automate running `kube.sh`

## Setup
+ clone this repo `git clone https://github.com/thenu97/interview-test-devops.git`
+ navigate to dev branch `git checkout dev`
+ cd into the master directory e.g: `cd ~/interview-test-devops/01_automation_project/master`
+ run `vagrant up` 
+ wait for deployment to finish
+ cd into worker directory e.g: `cd ~/interview-test-devops/01_automation_project/worker`
+ run `vagrant up` 
+ wait for deployment to finish
+ navigate back into the master directory and run `vagrant ssh`
+ on the master node, run `./home/vagrant/kube.sh`
+ wait for the pods to start up (check by running `kubectl get pods`)
+ access the nginx webpage on browser at localhost:30000

