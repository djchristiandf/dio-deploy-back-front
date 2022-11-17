#!/bin/bash

echo "Criando imagens ..."

docker build -t djchristiandf/projeto-backend:1.0 backend/.
docker build -t djchristiandf/projeto-database:1.0 database/.

echo "Realizando o push das imagens"

docker push djchristiandf/projeto-backend:1.0
docker push djchristiandf/projeto-database:1.0

echo "Criando serviços no cluster kubernetes ..."

kubectl apply -f ./services.yml

echo " Criando os deployments ..."

kubectl apply -f ./deployment.yml