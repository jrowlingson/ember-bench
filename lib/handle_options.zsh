function handle_options() {
  if [[ ${#version_flag} -gt 0  ]]; then
    print $version
    exit 0
  fi
  if [[ ${#help_flag} -gt 0  ]]; then
    print 'Usage: ember-bench [-vhn]'
    exit 0
  fi
  opts_pkg_man='yarn'
  if [[ ${#use_npm_flag} -gt 0  ]]; then
    opts_pkg_man='npm'
  fi
}
