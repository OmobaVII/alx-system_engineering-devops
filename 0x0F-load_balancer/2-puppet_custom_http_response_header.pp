# automate the task of creating a custom HTTP header response
exec { 'update packages':
    command => 'apt-get -y update',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
package { 'nginx':
    ensure => 'installed',
}
exec { 'add_header':
  provider    => shell,
  environment => ["HOST=${hostname}"],
  command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOST\";/" /etc/nginx/nginx.conf',
}
exec { 'restart nginx':
    command => 'sudo /etc/init.d/nginx restart',
    path    => '/usr/bin:/usr/sbin:/bin',
}
