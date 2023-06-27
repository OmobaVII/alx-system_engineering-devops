# Installing nginx with correct configurations

exec { 'update packages':
    command => 'apt-get -y update',
}
package { 'nginx':
    ensure => 'installed',
}
file { '/var/www/html/index.html':
    content => "Hello World!\n",
}
file { 'Nginx config file':
    ensure  => file,
    path    => '/etc/nginx/sites-enabled/default',
    content =>
"server {
        listen 80 default_server;
        listen [::]:80 default_server;

        # SSL configuration
        #
        # listen 443 ssl default_server;
        # listen [::]:443 ssl default_server;
        #
        # Note: You should disable gzip for SSL traffic.
        # See: https://bugs.debian.org/773332
        #
        location /redirect_me {
                 return 301 https://linkedin.com/in/sanni-omoba;
        }
}
",
}
exec { 'restart nginx':
    command => 'sudo /etc/init.d/nginx restart',
}
