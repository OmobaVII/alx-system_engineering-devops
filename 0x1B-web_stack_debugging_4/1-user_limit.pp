# Increase the limit for holberton user

exec { 'increase hard limit':
    command => "sed -i 's/holberton hard nofile 5/holberton hard nofile 4096/g' /etc/security/limits.conf",
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
}
exec { 'increase soft limit':
    command => "sed -i 's/holberton soft nofile 4/holberton soft nofile 4096/g' /etc/security/limits.conf",
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
}
