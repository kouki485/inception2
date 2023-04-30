FROM debian:buster
RUN apt-get -y update && apt-get -y install nginx openssl
COPY conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 443
ENV TZ Asia/Tokyo
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/kkohki.42.fr.pem -keyout /etc/ssl/kkohki.42.fr.key -subj "/C=JP/ST=Tokyo/L=Minato-city /O=42 School/OU=kkohki/CN=kkohki.42.fr"
CMD ["nginx", "-g", "daemon off;"]
