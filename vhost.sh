#bin/bash

if [ ! -d /etc/apache2/sites-available ]; then
	  mkdir /etc/apache2/sites-available
  fi

  if [ ! -d /etc/apache2/sites-enabled ]; then
	     mkdir /etc/apche2/sites-enabled
     fi

     echo "Enter the Domain Name: "
     read domainname

     if [ ! -f /etc/apache2/sites-available/$domainname.conf ]; then
	 touch /etc/apache2/sites-available/$domainname.conf
       fi

       echo "<VirtualHost $domainname:80>" > /etc/apache2/sites-available/$domainname.conf
       echo "   ServerName www.$domainname" >> /etc/apache2/sites-available/$domainname.conf
       echo "   ServerAlias $domainname" >> /etc/apache2/sites-available/$domainname.conf
       echo "   DocumentRoot /var/www/$domainname/public_html" >> /etc/apache2/sites-available/$domainname.conf
       echo "   ErrorLog /var/www/$domainname/error.log" >> /etc/apache2/sites-available/$domainname.conf
       echo "</VirtualHost>" >>  /etc/apache2/sites-available/$domainname.conf
       #echo EOF >> $domainname.conf

       ln -s /etc/apache2/sites-available/$domainname.conf /etc/apache2/sites-enabled/$domainname.conf

       if [ ! -d /var/www/$domainname ]; then
	        echo " Creating Document root Directory for $domainname"
		 mkdir /var/www/$domainname
		  mkdir /var/www/$domainname/public_html
	  fi
	  echo "Document root for $domainname: /var/www/$domainname/public_html"
