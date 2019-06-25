# Appvia Hub Node.js CircleCI hello world

This repo is designed to be a "Hello World" application with example CircleCi config for deploying to a Kubernetes cluster managed by the Appvia Hub.

Assuming you have the hub setup with the GitHub, Quay and Kubernetes integrations configured correctly. You should be able to carry out the following steps to deploy this application within your namespace.

1. Copy the contents of this repo into the hub-managed GitHub repo
2. Add Project in CircleCI
    * log in with GitHub https://circleci.com/vcs-authorize/
    * select your organisation from the top-left menu
    * click "Add Projects" from left-side menu
    * find project in list and click "Set Up Project"
    * go directly to step 5 and click "Start building"
3. Set the following environment variable on the project, all provided under "Credentials" in the hub
    * `QUAY_USERNAME` - Quay robot name
    * `QUAY_PASSWORD` - Quay robot token
    * `KUBE_API_SERVER` - Kubernetes Kube API
    * `KUBE_CERT_DATA` - Kubernetes CA Cert
    * `KUBE_TOKEN` - Kubernetes Token
    * `KUBE_NAMESPACE` - Kubernetes namespace you created
4. Build and watch
5. Visit hello world in a browser
    * the IP exposing the application will be shown at the end of the build log
    * alternatively, setup `kubectl` access using the instructions provided in the hub
        * get service IP from cluster using `kubectl -n <your-namespace> get svc hello-world --template="{{range .status.loadBalancer.ingress}}{{.ip}}{{end}}"` - ensure you amend the namespace
    * visit this in your browser

Assumptions:
* the GitHub and Quay repos share the same name