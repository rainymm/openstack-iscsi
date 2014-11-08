class iscsi(
	$server_ip = undef,
	$device = undef,
    $mount = undef
) {
	
  anchor { 'iscsi::begin': } ->
  class { '::iscsi::install': } ->
  class { '::iscsi::service':
		server_ip => $server_ip			
   } ->
  class { '::iscsi::mount':
		device => $device,
		endpoint => $mount
   } ->
  anchor { 'ntp::end': }

}
