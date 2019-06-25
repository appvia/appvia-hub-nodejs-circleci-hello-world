echo "-> waiting for service external ip address"
SERVICE_IP=$(kubectl -n $KUBE_NAMESPACE get svc hello-world --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")
while [ -z "$SERVICE_IP" ]; do
  sleep 1
  echo "." | tr -d '\n'
  SERVICE_IP=$(kubectl -n $KUBE_NAMESPACE get svc hello-world --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}")
done
echo "Visit your deployed app at: http://$SERVICE_IP"
