#!/usr/bin/bash
export TF_VERSION=0.11.13
export GO_VERSION=1.12.5

# Install essentials
sudo apt install -y tmux xclip silversearcher-ag net-tools nmap autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev git

# Install Terraform
curl -o /tmp/terraform.zip "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
pushd /tmp
unzip terraform.zip
sudo mv terraform /usr/local/bin/
popd

# Install pip
sudo apt install -y python-setuptools python-dev build-essential
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user

# Install AWS ClI
$HOME/.local/bin/pip install awscli --user

# Install Golang
curl -o /tmp/go.tar.gz "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz"
sudo tar -C /usr/local -xzf /tmp/go.tar.gz


# Create workspace
mkdir ~/Workspace 
mkdir -p ~/.config

# Install git prompt
curl -L -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# Copy configuration files
cp -R Scripts ~/
cp -R .vim ~/
cp .vimrc	~/
cp .tmux.conf ~/
cp .bashrc ~/
