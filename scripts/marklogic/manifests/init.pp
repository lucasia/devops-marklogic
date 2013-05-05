class marklogic (
) {

  package { "MarkLogic":
      ensure => "installed",
      provider => "rpm",
      source => "puppet://localhost/modules/marklogic/MarkLogic-6.0-2.3.x86_64.rpm",
  }

  service { '/etc/init.d/MarkLogic':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

}

