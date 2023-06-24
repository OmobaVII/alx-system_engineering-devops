# Configuring SSH configuration file to connect to a server without a password
# SSH client configuration to use private key ~/.ssh/school
# SSH client configuration to refuse authenticate using a password

file { '/root/.ssh/config':
    ensure  => file,
    path    => '/root/.ssh/config',
    content => "Host 18.235.234.111\n\t PasswordAuthentication no\n\t IdentityFile ~/.ssh/school",
    mode    => '0644',
}
