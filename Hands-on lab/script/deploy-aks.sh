#!/bin/bash

# ---
# このスクリプトは
# クラウド ネイティブのアプリケーション
# ハンズオン ラボの事前セットアップを行うためのものです。
# 事前準備の参考にしてください。
# ---
export LOCATION=eastus
export LOCATIONPAIR=eastus2

echo " "
echo "Cloud Native Applications before the hands-on lab Setup"
echo "------------------------------------"
export SUFFIX=$(openssl rand -hex 3 | fold -w 3 | head -1)

# task3
echo " "
echo $'\U2693' " Create Resources Group"
echo "------------------------------------"
az group create -l $LOCATION -n fabmedical-$SUFFIX

# task4
if [ ! -d ~/.ssh ]; then mkdir ~/.ssh; fi
if [ ! -f ~/.ssh/fabmedical ];then ssh-keygen -t rsa -C comment -f ~/.ssh/fabmedical -N "";fi
SSHKEY=$(cat ~/.ssh/fabmedical.pub)

# task5
echo " "
echo $'\U2693' " Create Service Principal"
echo "------------------------------------"
SP_NAME=Fabmedical-sp-workshop-$RANDOM
SUBID=$(az account show --query id -o tsv)
SP=$(az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$SUBID" -n="http://$SP_NAME" --skip-assignment -o json)

SP_APPID=$(echo $SP | jq -r .appId)
SP_PASSWORD=$(echo $SP | jq -r .password)
SP_OBJECTID=$(az ad sp show --id "$SP_APPID" --query "{objectId:@.objectId}" -o tsv)

# task6
echo " "
echo $'\U2693' " Deploy ARM Template"
echo "------------------------------------"
LOCATIONNAME=$(az account list-locations --query "[?name == '$LOCATION'].{DisplayName:displayName}" -o tsv)
LOCATIONPAIRNAME=$(az account list-locations --query "[?name == '$LOCATIONPAIR'].{DisplayName:displayName}" -o tsv)

## Create parameter file
cd ../arm
PARAMFILE=azuredeploy.parameters.$SUFFIX.json
cp -f azuredeploy.parameters.template.json $PARAMFILE

cat azuredeploy.parameters.template.json | sed -e 's:"$SUFFIX":"'"$SUFFIX"'":' \
    -e 's:"$SSHKEY":"'"$SSHKEY"'":' \
    -e 's:"$SP_APPID":"'"$SP_APPID"'":' \
    -e 's:"$SP_PASSWORD":"'"$SP_PASSWORD"'":' \
    -e 's:"$SP_OBJECTID":"'"$SP_OBJECTID"'":' \
    -e 's:"$LOCATION":"'"$LOCATION"'":' \
    -e 's:"$LOCATIONNAME":"'"$LOCATIONNAME"'":' \
    -e 's:"$LOCATIONPAIR":"'"$LOCATIONPAIR"'":' \
    -e 's:"$LOCATIONPAIRNAME":"'"$LOCATIONPAIRNAME"'":' >$PARAMFILE

sleep 3m
az group deployment create -g "fabmedical-$SUFFIX" \
    --template-file azuredeploy.json \
    --parameters $PARAMFILE

echo "------------------------------------"
echo " "
echo "Complete!"
echo " "
echo "Your Service Principal:"
echo ApplicationID: $SP_APPID
echo Password: $SP_PASSWORD
echo " "
echo "Enjoy!" $'\U2615' 
echo "------------------------------------"
