#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/moonrepo/moon"
TOOL_NAME="moon"
TOOL_TEST="moon --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/v\d.*' | cut -d/ -f3- |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

download_release() {
	local version filename url target
	target="$(get_target)"
	version="$1"
	filename="$2"

	#Ex: https://github.com/moonrepo/moon/releases/download/v1.17.3/moon-aarch64-apple-darwin
	url="$GH_REPO/releases/download/v${version}/${target}"

	echo "* Downloading $TOOL_NAME release $version for target ${target}..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

get_target() {
	arch=$(uname -sm)

	if [[ "${OS-}" == "Windows_NT" ]]; then
		target="moon-x86_64-pc-windows-msvc.exe"
	else
		case "$arch" in
		"Darwin x86_64") target="moon-x86_64-apple-darwin" ;;
		"Darwin arm64") target="moon-aarch64-apple-darwin" ;;
		"Linux aarch64") target="moon-aarch64-unknown-linux" ;;
		"Linux x86_64") target="moon-x86_64-unknown-linux" ;;
		*)
			echo "Unsupported system or architecture \"$arch\". Unable to install moon!"
			exit 1
			;;
		esac
	fi

	if [[ "$arch" == "Linux"* ]]; then
		deps=$(ldd --version 2>&1 || true)

		if [[ $deps == *"musl"* ]]; then
			target="$target-musl"
		else
			target="$target-gnu"
		fi
	fi

	echo $target
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only!"
	fi

	(
		echo "* Installing $TOOL_NAME $version..."
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"
		chmod 755 "$install_path/$TOOL_NAME"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
