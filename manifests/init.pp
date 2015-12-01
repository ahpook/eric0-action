# Define: action
# ===========================
#
# A defined type which allows you to model ansible resources as actions
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Examples
# --------
#
# @example
#    action { 'osx_say_hello':
#      module => 'osx_say',
#      args   => { 
#                   msg   => "hello",
#                   voice => "Moira"
#                }
#    }
#
#  file { '/tmp/whatever':
#    content => etc,
#    notify  => Action['osx_say_hi']
#  }
#
# Authors
# -------
#
# Eric Sorenson <eric0@puppetlabs.com>
#
# Copyright
# ---------
#
# Copyright 2015 Puppet Labs Inc.
#
define action (String $module, Hash $args) {

  $argstring = $args.map |$value| {
    "${value[0]}=${value[1]}"
  }.join(" ")

  exec { $title:
    path => "/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin",
    environment => "HOME=/home/vagrant",
    command => "ansible localhost -vvv --connection=local -m ${module} -a \"${argstring}\"",
  }

}
