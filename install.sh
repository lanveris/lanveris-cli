#!/usr/bin/env sh
set -eu

repo="${LANVERIS_CLI_REPO:-XuZhaoTong/lanveris-cli}"
version="${LANVERIS_VERSION:-latest}"
bin_dir="${LANVERIS_BIN_DIR:-$HOME/.local/bin}"
tmp_dir="$(mktemp -d)"

cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT INT TERM

need() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "lanveris install: missing required command: $1" >&2
    exit 1
  fi
}

need curl
need uname

os="$(uname -s)"
arch="$(uname -m)"

case "$os" in
  Darwin) os_name="darwin" ;;
  Linux) os_name="linux" ;;
  *)
    echo "lanveris install: unsupported OS: $os" >&2
    exit 1
    ;;
esac

case "$arch" in
  arm64|aarch64) arch_name="arm64" ;;
  x86_64|amd64) arch_name="amd64" ;;
  *)
    echo "lanveris install: unsupported architecture: $arch" >&2
    exit 1
    ;;
esac

asset="lanveris-${os_name}-${arch_name}"
if [ "$version" = "latest" ]; then
  url="https://github.com/${repo}/releases/latest/download/${asset}"
else
  url="https://github.com/${repo}/releases/download/${version}/${asset}"
fi

mkdir -p "$bin_dir"
echo "lanveris install: downloading ${asset} from ${repo} (${version})"
curl -fL "$url" -o "$tmp_dir/lanveris"
chmod +x "$tmp_dir/lanveris"
mv "$tmp_dir/lanveris" "$bin_dir/lanveris"

echo "lanveris installed to $bin_dir/lanveris"
case ":$PATH:" in
  *":$bin_dir:"*) ;;
  *)
    echo "Add this to PATH if needed:"
    echo "  export PATH=\"$bin_dir:\$PATH\""
    ;;
esac

"$bin_dir/lanveris" help >/dev/null 2>&1 || true
echo "lanveris install: done"
