lua << EOF
local iron = require('iron')

iron.core.set_config {
  repl_open_cmd = "10 split",
  preferred = {
    python = "ipython"
  }
}
EOF
