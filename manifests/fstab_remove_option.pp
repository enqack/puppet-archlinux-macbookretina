# Define: puppet-archlinux-macbookretina::fstab_remove_option
#
# Removes a specified option from /etc/fstab entry for a specified filesystem
#
# Parameters:
#
# $drive:: the filesystem specifier, first column in /etc/fstab
#
# $option:: string, the option to remove
#
# Actions:
#   - remove a specified option for a specified filesystem in /etc/fstab
#
# Requires:
#
# Sample Usage:
#
define puppet-archlinux-macbookretina::fstab_remove_option ($drive = $title, $option) {

  augeas {"sda_remove_${option}_${drive}":
    context => '/files/etc/fstab',
    #incl    => '/etc/fstab',
    #lens    => 'fstab.aug',
    changes => [
      "rm *[spec='$drive']/opt[.='$option']",
    ],
    onlyif  => "match *[spec = '$drive']/opt[.='$option'] size > 0",
  }

}

