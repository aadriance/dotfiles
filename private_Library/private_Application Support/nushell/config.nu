# config.nu
#
# Installed by:
# version = "0.112.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
source ~/.local/share/atuin/hex-init.nu
source ~/.local/share/atuin/init.nu

let terafox_theme = {
   binary: "#ff8349"
   block: "#cbd9d8"
   bool: "#ff9664"
   cellpath: "#ebebeb"
   date: "#7aa4a1"
   duration: "#7aa4a1"
   filesize: "#ff8349"
   float: "#ff8349"
   int: "#ff8349"
   list: "#cbd9d8"
   nothing: "#ebebeb"
   range: "#ebebeb"
   record: "#ebebeb"
   string: "#7aa4a1"

   leading_trailing_space_bg: "#254147"
   header: "#cbd9d8"
   empty: "#5a93aa"
   row_index: "#587b7b"
   hints: "#587b7b"
   separator: "#6d7f8b"

   shape_block: "#cbd9d8"
   shape_bool: "#ff9664"
   shape_external: "#ad5c7c"
   shape_externalarg: "#ebebeb"
   shape_filepath: "#ebebeb"
   shape_flag: "#a1cdd8"
   shape_float: "#ff8349"
   shape_globpattern: "#fdb292"
   shape_int: "#ff8349"
   shape_internalcall: "#ad5c7c"
   shape_list: "#cbd9d8"
   shape_literal: "#7aa4a1"
   shape_nothing: "#afd4de"
   shape_operator: "#cbd9d8"
   shape_record: "#cbd9d8"
   shape_string: "#7aa4a1"
   shape_string_interpolation: "#fdb292"
   shape_table: "#cbd9d8"
   shape_variable: "#ebebeb"
}

$env.config.color_config = $terafox_theme

$env.config.buffer_editor = "nvim"
$env.EDITOR = "nvim"
alias ash = autossh -M 0 -q
$env.config.show_banner = false

#enable direnv
$env.config.hooks.env_change.PWD = $env.config.hooks.env_change.PWD? | default []
$env.config.hooks.env_change.PWD ++= [{||
  if (which direnv | is-empty) {
    return
  }
  direnv export json | from json | default {} | load-env
}]
