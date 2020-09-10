mkdir ~/GoProjects
mkdir ~/GoProjects/src
mkdir ~/PythonProjects
mkdir ~/pemKeys

# basic update and upgrade
sudo apt update && sudo apt -y upgrade

# install Chromium
sudo apt install -y chromium

#install Go
wget https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz
tar xvfz go1.14.3.linux-amd64.tar.gz

#set Go Path
cat >> ~/.profile << EOF
export GOROOT=~/go
export GOPATH="$HOME"/GoProjects
export PATH="$GOPATH"/bin:"$GOROOT"/bin:"$PATH"
EOF

source ~/.profile

go get github.com/lib/pq

# install VScode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install -y apt-transport-https
sudo apt install -y code

# install postgres
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RELEASE=$(lsb_release -cs)
echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt -y install postgresql-11

sudo apt install -y build-essential

#install docker
sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo chmod 666 /var/run/docker.sock

#Add anaconda 
sudo apt install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh

sudo apt install -y libpq-dev python3-dev
pip install psycopg2

#Add protobuff compiler and grpc
sudo apt install -y protobuf-compiler
export GO111MODULE=on
go get github.com/golang/protobuf/protoc-gen-go
go get -u google.golang.org/grpc

#Need to add NPM
sudo apt install  -y nodejs
sudo apt install -y npm
