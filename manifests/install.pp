class iscsi::install {
	package { 'iscsi-initiator-utils':
		ensure => present,
	}
}
