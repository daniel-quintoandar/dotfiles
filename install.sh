#!/usr/bin/sh

default_workspace="${HOME}/workspace"

# workspace
echo "Enter your workspace folder (default: ${default_workspace}): "
read workspace
[ "x" = "x${workspace}" ] && workspace="${default_workspace}"

mkdir -p "${workspace}"

echo "export WORKSPACE=${workspace}" > "${HOME}/.env"

# config files
config_dir="${XDG_CONFIG_HOME}"
[ "x" = "x${config_dir}" ] && config_dir="${HOME}/.config"

mkdir -p "${config_dir}"

for config_file in config/*; do
  ln -nsf "${PWD}/${config_file}" "${config_dir}/${config_file#config/}"
done

# local data
local_dir="${XDG_DATA_HOME%/share}"
[ "x" = "x${local_dir}" ] && local_dir="${HOME}/.local"

mkdir -p "${local_dir}"

for local_file in local/*; do
  ln -nsf "${PWD}/${local_file}" "${local_dir}/${local_file#local/}"
done

# dotfiles
for file in *; do
  case "${file}" in
    TODO*|README*|install*|config*|local*) ;;
    *) ln -nsf "${PWD}/${file}" "${HOME}/.${file}"
  esac
done

echo
echo "Done! Don't forget to install optional dependencies, see README.md"
echo