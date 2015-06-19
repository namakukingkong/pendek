#!/bin/sh
echo "===>Start"

echo "===>Sync repo..."
git push heroku master

echo "===>Run Migration..."
heroku run rake db:migrate --app pemendekan
echo "===>Restart Dyno..."
heroku restart --app pemendekan
echo "===>Populate fake companies"


echo "===>Finished"


echo "Thankyou"
echo "--- alam[dot]ybs[at]gmail[dot]com"


