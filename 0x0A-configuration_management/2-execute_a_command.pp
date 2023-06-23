# Kills a process named killmenow
# Must use 'exec' and 'pkill'

exec { 'pkill killmenow':
    command => 'pkill -f killmenow',
    path    => ['/bin', '/usr/bin'],
}
