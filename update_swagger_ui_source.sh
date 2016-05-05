#!/usr/bin/env bash

wget https://github.com/swagger-api/swagger-ui/archive/master.zip && mv master.zip swagger-ui-master.zip
unzip swagger-ui-master.zip
cp -R swagger-ui-master/dist/ public/swagger_ui_static_engine
rm -rf swagger-ui-master.zip ./swagger-ui-master
mv public/swagger_ui_static_engine/index.html app/views/swagger_ui_static_engine/engine/index.html.erb
printf "\n\nThe static Swagger UI files have now been updated with the latest versions.\nNow, you must use git to merge back in the changes necessary to make these files work with the engine.\nThank you & godspeed!"