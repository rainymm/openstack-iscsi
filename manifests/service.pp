class iscsi::service(
	$server_ip  = undef,
) {
	exec { 'test-id':
		command => 'echo Could not perform SendTargets discovery: encountered connection failure',
		logoutput => on_failure,
		unless => "/sbin/iscsiadm -m node -p ${server_ip} -t sendtargets",
		path => ['/usr/bin','/usr/sbin','/bin','/sbin'],
	}
	
	service { 'iscsid':
		ensure => running,
		enable => true,
		hasstatus => true,
		require => Exec['test-id']
	}
	
	service { 'iscsi':
		ensure => running,
		enable => true,
		hasstatus => true,
		require => Exec['test-id']
	}

	exec { 'link-server':
		command => "iscsiadm -m node -p ${server_ip}:3260 -l",
		logoutput => on_failure,
		path => ['/usr/bin','/usr/sbin','/bin','/sbin'],
		require => Service['iscsi']
	}
}

