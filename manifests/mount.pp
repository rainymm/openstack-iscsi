class iscsi::mount(
	#$device = '/dev/sdc1',
	$device = undef,
	$endpoint = undef
) {

	mount { $endpoint:
        device => "${device}",
        fstype => 'ext4',
        ensure => 'mounted',
        atboot => true,
        options => '_netdev',
    }

}
