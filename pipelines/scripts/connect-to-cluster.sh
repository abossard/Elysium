#!/bin/bash
PRODUCT=$1
ENVIRONMENT=$2

NAME=`az aks list  --query "[?tags.product == '$PRODUCT' && tags.environment == '$ENVIRONMENT'].name|[0]" -o json | tr -d \"`
RESOURCE_GROUP=`az aks list  --query "[?tags.product == '$PRODUCT' && tags.environment == '$ENVIRONMENT'].resourceGroup|[0]" -o json | tr -d \"`
az aks get-credentials --resource-group $RESOURCE_GROUP --name $NAME --admin