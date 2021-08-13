#!/bin/bash
if [[ ! $(which git) ]]; then
        sudo dnf update -y
        sudo dnf install git -y
        git --version
        echo "Git Installed"
else
        echo "Git Exists"
fi

if [[ ! $(which terraform) ]]; then
        wget https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip
        sudo unzip terraform_0.13.3_linux_amd64.zip
        sudo mv terraform /usr/bin
        terraform -version
        echo "Terraform Installed"
        rm -rf terraform_0.13.3_linux_amd64.zip
else
        echo "Terraform Exists"
fi
