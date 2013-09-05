#!/usr/bin/bash

wget --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" 
"http://download.oracle.com/otn-pub/java/jdk/7u25-b15/jdk-7u25-linux-x64.tar.gz"

tar xfz jdk-7u25-linux-x64.tar.gz
sudo mv jdk1.7.0_25  /usr/local/
cd ~
cat >> ./.bash_profile <<EOF
#Configure JAVA_HOME
export JAVA_HOME=/usr/local/jdk1.7.0_25
export PATH=\$PATH:\$JAVA_HOME

EOF

sudo apt-get install make
sudo apt-get install g++
npm install java

echo "----------Testing Node Java----------"
node -e "var java = require('java'); var rslt = java.getStaticFieldValue(\"java.lang.System\", \"out\"); rslt.printlnSync(\"Hello, World\! from node java\"); rslt.printlnSync(\"node java is functional \");"

