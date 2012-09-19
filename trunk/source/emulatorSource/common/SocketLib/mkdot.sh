#!/bin/sh
PROJECT_DIR=/usr/local/apache/www.libsockets.net/htdocs
PROJECT_NAME=sockets
/usr/local/bin/dp -D_THREADSAFE_SOCKETS -lr -dot -cluster | grep -v std > x.dot 
dot -Tpng -o /usr/local/apache/www.libsockets.net/htdocs/sockets.png x.dot
dot -Tcmap -o /usr/local/apache/www.libsockets.net/htdocs/sockets.cmap x.dot
/usr/local/bin/mkjs $PROJECT_DIR/$PROJECT_NAME.cmap > $PROJECT_DIR/$PROJECT_NAME.js
