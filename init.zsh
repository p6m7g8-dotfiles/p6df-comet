# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::comet::deps()
#
#>
######################################################################
p6df::modules::comet::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-python
  )
}

######################################################################
#<
#
# Function: p6df::modules::comet::langs()
#
#>
######################################################################
p6df::modules::comet::langs() {

  pip install numpy
  pip install "cookiecutter>1.7.0"

  pip install comet_ml

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::comet::init()
#
#  Environment:	 COMET_API_KEY COMET_LOGGING_FILE COMET_LOGGING_FILE_LEVEL P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::comet::init() {

  p6_env_export "COMET_LOGGING_FILE_LEVEL" "debug"
  p6_env_export "COMET_LOGGING_FILE" "/tmp/comet.debug.log"

  p6_file_load "$P6_DFZ_SRC_DIR/pgollucci/home-private/cr/comet/token"
  p6_env_export "COMET_API_KEY" "$P6_COMET_API_KEY"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::comet::prompt::line()
#
#  Returns:
#	str - str
#
#  Environment:	 P6_COMET_WORKSPACE
#>
######################################################################
p6df::modules::comet::prompt::line() {

  local str="comet:\t\t  w:$P6_COMET_WORKSPACE u:$P6_COMET_USER"

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::comet::vscodes()
#
#>
######################################################################
p6df::modules::comet::vscodes() {

  code --install-extension comet.ml.comet

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::comet::clones()
#
#  Environment:	 P6_DFZ_SRC_FOCUSED_DIR
#>
######################################################################
p6df::modules::comet::clones() {

  p6_github_login_clone "comet-ml" "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}

# https://www.comet.ml/
# https://github.com/comet-ml/issue-tracking
# https://github.com/comet-ml/comet-examples
# https://www.comet.ml/docs/

