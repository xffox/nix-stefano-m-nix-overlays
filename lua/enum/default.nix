{ lua, buildLuaPackage, fetchFromGitHub }:
let

  pname = "enum";

in
buildLuaPackage rec {
  version = "0.1.3";
  name = "${pname}-${version}";
  inherit pname;

  src = fetchFromGitHub {
    owner = "stefano-m";
    repo = "lua-${pname}";
    rev = "v${version}";
    hash = "sha256-mws9T764NLv2ktJntGZYmakgSRGFqohgUaHVk0kH+LI=";
  };

  buildPhase = ":";

  installPhase = ''
    mkdir -p "$out/share/lua/${lua.luaversion}"
    cp -r src/${pname} "$out/share/lua/${lua.luaversion}/"
  '';

}
