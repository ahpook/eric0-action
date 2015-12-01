
#action { 'osx_say_hello':
#  module => 'osx_say',
#  args => {
#    voice => "Moira",
#    msg   => "Hello",
#  }
#}

action { 'stats_etc_passwd':
  module => 'stat',
  args   => {  path => '/etc/passwd'  }
}
