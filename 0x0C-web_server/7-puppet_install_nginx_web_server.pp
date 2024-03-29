# installing nginx with correct configurations
exec { 'add nginx stable repo':
  command => 'sudo add-apt-repository ppa:nginx/stable',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
exec { 'update packages':
    command => 'apt-get -y update',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
package { 'nginx':
    ensure => 'installed',
}
exec { 'nginx index':
    command => "echo 'Hello World!' | sudo tee /usr/share/nginx/html/index.html",
    user    => 'root',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
file { '/var/www/html/index.nginx-debian.html':
    content => "Hello World!",
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
    path    => '/usr/bin:/usr/sbin:/bin',
}
