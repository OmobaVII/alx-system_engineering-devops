# automate the task of creating a custom HTTP header response
exec { 'update packages':
    command => 'apt-get -y update',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
exec {'install Nginx':
    provider => posix,
    command  => 'sudo apt-get -y install nginx',
    path     => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    before   => Exec['add_header'],
}
package { 'nginx':
    ensure => 'installed',
}
exec { 'add_header':
    provider => posix,
    command  => "sudo sed -i '23a\\\tadd_header X-Served-By \"\$HOSTNAME\";' /etc/nginx/sites-available/default",
    path     => '/usr/bin:/usr/sbin:/bin:/sbin',
    before   => Exec['restart nginx']
}
exec { 'restart nginx':
    command => 'sudo /etc/init.d/nginx restart',
    path    => '/usr/bin:/usr/sbin:/bin',
}
