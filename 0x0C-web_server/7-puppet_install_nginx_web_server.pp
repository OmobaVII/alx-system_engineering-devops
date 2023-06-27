exec { 'update packages':
    command => 'apt-get -y update',
}
package { 'nginx':
    ensure => 'installed',
}

