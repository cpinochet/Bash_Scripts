#!/bin/bash
PR=`ps aux | grep java | grep tomcat | wc -l`
if [ "$PR" -eq "0" ]; then
  echo "Hola!"
else
 echo "servicio andando..."
fi
