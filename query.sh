!#/bin/sh

token=`cat oauth.token`
curl=`curl -H "Authorization: token $token" https://api.github.com/search/code?q=filename:.DS_Store`
echo $curl
