# container runtime network not ready: NetworkReady=false reason:NetworkPluginNotReady error in kubectl describe nodes
kubectl create -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml
kubectl apply -f /home/vagrant/nginx.yml