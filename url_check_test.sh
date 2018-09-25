#!/bash/bin
url=http://localhost:8080
while ! curl $url &>/dev/null; do echo "Thingworx URL is Down!!!!!!!!!! - `date`"; done ; echo "##### Thingworx URL is UP ##### - `date`" ;
cat /appl/tomcat/webapps/Thingworx/META-INF/MANIFEST.MF
bash /home/ftashev/VD/TWX_upgrade/8.2.7/url_check.sh

