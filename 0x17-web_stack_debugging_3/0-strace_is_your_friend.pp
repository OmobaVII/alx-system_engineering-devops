# Fixes the issue with the container by correcting a typo error in the config file of wordpress
exec { 'fix typo':
    command => "sed -i '137s/\/class-wp-locale\.phpp/\/class-wp-locale\.php/' /var/www/html/wp-settings.php",
    path    => '/usr/bin:/usr/sbin:/bin:/sbin',
}
