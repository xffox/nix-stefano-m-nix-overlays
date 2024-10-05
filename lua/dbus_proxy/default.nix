{ lua, lgi, buildLuaPackage, fetchFromGitHub }:
let

  pname = "dbus_proxy";

in
# TODO: add busted and checkPhase?
buildLuaPackage rec {
  version = "0.10.4";
  name = "${pname}-${version}";
  inherit pname;

  src = fetchFromGitHub {
    owner = "stefano-m";
    repo = "lua-${pname}";
    rev = "v${version}";
    hash = "sha256-yALxyLx5HeOTgK8r4C/xakcNg1L3t76Y9Dq3pIk5+Rs=";
  };

  propagatedBuildInputs = [ lgi ];

  buildPhase = ":";

  installPhase = ''
    mkdir -p "$out/share/lua/${lua.luaversion}"
    cp -r src/${pname} "$out/share/lua/${lua.luaversion}/"
  '';

}
