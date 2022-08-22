#!/bin/bash
if [ -z "$(sudo -u ubuntu kubectl get deployment | grep deployment-backend)" ]; then
    sudo -u ubuntu kubectl create -f manifest/deployment-backend.yaml
else
    sudo -u ubuntu kubectl set image deployments/deployment-backend go_backend=jedie20/go_backend:${docker_tag}
fi
[[ "$?" != "0" ]] && exit 1

sudo -u ubuntu kubectl apply -f manifest/service-backend.yaml
[[ "$?" != "0" ]] && exit 1

# =======================

if [ -z "$(sudo -u ubuntu kubectl get deployment | grep deployment-frontend)" ]; then
    sudo -u ubuntu kubectl create -f manifest/deployment-frontend.yaml
else
    sudo -u ubuntu kubectl image deployments/deployment-frontend go_backend=jedie20/frontend:${docker_tag}
fi
[[ "$?" != "0" ]] && exit 1

sudo -u ubuntu kubectl apply -f manifest/service-frontend.yaml
exit $?