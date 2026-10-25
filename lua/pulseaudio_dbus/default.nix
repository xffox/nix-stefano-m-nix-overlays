{
  dbus_proxy,
  lua,
  buildLuaPackage,
  fetchFromGitHub,
}:
let

  pname = "pulseaudio_dbus";

in
buildLuaPackage rec {
  version = "0.12.1-dev";
  name = "${pname}-${version}";
  inherit pname;

  src = fetchFromGitHub {
    owner = "xffox";
    repo = "lua-${pname}";
    rev = "ff8fec2bc3b6186f858714171c2e1705bfbad84e";
    sha256 = "0br4rafbh7fl3yixlr9zlf1crflklghvgvjd4zj57k720iq5bdzq";
  };

  propagatedBuildInputs = [ dbus_proxy ];

  buildPhase = ":";

  installPhase = ''
    mkdir -p "$out/share/lua/${lua.luaversion}"
    cp -r src/${pname} "$out/share/lua/${lua.luaversion}/"
  '';

}
