#! /bin/bash
easy_install xerox
easy_install requests
curl -O https://raw.githubusercontent.com/SophisticaSean/usefulscripts/master/enrollmentmagic
mv enrollmentmagic /usr/bin/enrollmentmagic
chmod +x /usr/bin/enrollmentmagic
echo Make sure to set these three env variables: sandbox_token, local_token, and portal_token
echo With something like "export local_token='some_token'"
