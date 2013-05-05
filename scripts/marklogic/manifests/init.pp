# TODO: change MarkLogic service to specify restart and status rather than puppet defaults
class marklogic (
    $ml_pkg_name = "MarkLogic.x86_64",
    $ml_install_file = "MarkLogic-6.0-2.3.x86_64.rpm"
) {

  file {"/tmp/${ml_install_file}":
    ensure => present,
    source => "puppet:///modules/marklogic/${ml_install_file}",
  }


  # Check if MarkLogic is installed, install if not
  # TODO: source is fetching from puppet master, change to specify hostname
  package { 'MarkLogic':
    name     => $ml_pkg_name,
    ensure   => installed,
    source   => File["/tmp/${ml_install_file}"],
  }


  # Check if MarkLogic service is running, start if not
  # hasrestart — Whether to use the init script’s restart command instead of stop+start. 
  # hasstatus — Whether to use the init script’s status command instead of grepping the process table. 

  service { 'MarkLogic':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    require => Package['MarkLogic'],
  }



}

