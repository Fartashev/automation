#!/bin/bash
# Automated Thingworx Patch Deployment# 
Thingworx=/home/ftashev/VD/TWX_upgrade/8.2.7/Thingworx.war
url=http://localhost:8080
url2=http://localhost:2019/ExperienceService
Date=$(date +"%Y%m%d")

set -e 
#Stopping Tomcat#
echo " Stopping Tomcat "
echo ""
service tomcat stop
pkill -9 java
#Creating a backup of Thingworx.war
echo " Creating a Backup of the Thingworx.war file "
echo ""
mv /appl/tomcat/webapps/Thingworx.war /appl/tomcat/webapps/Thingworx.war__$Date
#Patch installation
echo " Installing new patch Thingworx 8.2.7 "
echo ""
cp $Thingworx /appl/tomcat/webapps/
#Permission Adjustments
chmod u+x /appl/tomcat/webapps/Thingworx.war && chown twadmin.twadmin /appl/tomcat/webapps/Thingworx.war
#Creating Thingworx Backup Folder (customization). 
echo " Creating Backup for  Thingworx  "
echo ""
mv /appl/tomcat/webapps/Thingworx /appl/Thingworx_backup_$Date
service tomcat start
#URL Check
while ! curl $url &>/dev/null; do echo "Thingworx URL is Down!!!!!!!!!! - `date`"; done ; echo "##### Thingworx URL is UP ##### - `date`" ;
cat /appl/tomcat/webapps/Thingworx/META-INF/MANIFEST.MF














