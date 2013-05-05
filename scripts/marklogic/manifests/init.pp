# TODO: change MarkLogic service to specify restart and status rather than puppet defaults
class marklogic (
) {


# Check if MarkLogic is installed, install if not
  package { "MarkLogic":
      ensure => present,
      provider => "rpm",
      source => "puppet://localhost/modules/marklogic/MarkLogic-6.0-2.3.x86_64.rpm",
  }


# Check if MarkLogic service is running, start if not
# hasrestart — Whether to use the init script’s restart command instead of stop+start. 
# hasstatus — Whether to use the init script’s status command instead of grepping the process table. 

  service { 'MarkLogic':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    require => Package['Marklogic']
  }

  

}

