{% set augeas_pkgname = salt['grains.filter_by']({
  'Arch': 'python2-augeas',
  'RedHat': 'python-augeas',
  'Debian': 'python-augeas'
  }, grain='os_family', default='Arch')
%}

augeas:
  pkg.installed:
    - name: {{ augeas_pkgname }}
