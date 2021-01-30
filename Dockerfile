FROM httpd:2.4
RUN apt-get -y update && apt-get -y install wget unzip libdigest-perl-md5-perl
RUN wget https://github.com/meso-cacase/difff/archive/master.zip
RUN unzip master
RUN rm -f /usr/local/apache2/htdocs/index.html
RUN cp -r difff-master/. /usr/local/apache2/htdocs/
RUN rm -rf diff-master
RUN sed -ri 's/#LoadModule cgid_module/LoadModule cgid_module/g; \
             s/#LoadModule rewrite_module/LoadModule rewrite_module/g; \
             s/AllowOverride None/AllowOverride All/g; \
             s/DirectoryIndex index.html/DirectoryIndex index.cgi/g; \
             s/Options Indexes FollowSymLinks/Options Indexes FollowSymLinks ExecCGI/g; \
             s/#AddHandler cgi-script .cgi/AddHandler cgi-script .pl .cgi/g' /usr/local/apache2/conf/httpd.conf
RUN sed -ri "s|'https://difff.jp/'|'./'|g" /usr/local/apache2/htdocs/difff.pl
RUN sed -ri "s|'https://difff.jp/en/'|'./'|g" /usr/local/apache2/htdocs/en/difff_en.pl
RUN sed -ri "s|ちい。|さい。|g" /usr/local/apache2/htdocs/difff.pl
RUN sed -ri "s|ちい。|さい。|g" /usr/local/apache2/htdocs/save.cgi
RUN chown daemon /usr/local/apache2/htdocs/data/
RUN chgrp daemon /usr/local/apache2/htdocs/data/
EXPOSE 80