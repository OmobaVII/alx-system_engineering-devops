# Fix the limit of nginx

exec { 'increase-limit':
    command => "sed -i 's/15/4096/g' /etc/default/nginx",
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    before  => Exec['stop nginx'],
}
exec { 'stop nginx':
    command => 'service nginx stop',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    before  => Exec['start nginx'],
}
exec { 'start nginx':
    command => 'service nginx start',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
