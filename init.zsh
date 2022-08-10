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

  p6df::modules::comet::prompt::init

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::comet::prompt::init()
#
#>
######################################################################
p6df::modules::comet::prompt::init() {

  p6df::core::prompt::line::add "p6df::modules::comet::prompt::line"
}

######################################################################
#<
#
# Function: p6df::modules::comet::prompt::line()
#
#>
######################################################################
p6df::modules::comet::prompt::line() {

  p6_comet_prompt_info
}

######################################################################
#<
#
# Function: str str = p6_comet_prompt_info()
#
#  Returns:
#	str - str
#
#  Environment:	 P6_COMET_WORKSPACE
#>
######################################################################
p6_comet_prompt_info() {

  local str="comet:\t\t  w:$P6_COMET_WORKSPACE u:$P6_COMET_USER"

  p6_return_str "$str"
}
