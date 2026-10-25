{
  pulseaudio_dbus,
  lua,
  buildLuaPackage,
  fetchFromGitHub,
}:
let

  pname = "pulseaudio_widget";

in
buildLuaPackage rec {
  version = "0.6.2-dev";
  name = "${pname}-${version}";
  inherit pname;

  src = fetchFromGitHub {
    owner = "xffox";
    repo = "awesome-${pname}";
    rev = "9174bfb2fb23c7785879214976157525d5807432";
    sha256 = "0sxcm4j0h6x02s1pjdkz3crzxjd249hls6pip8r4jlck2xf19vma";
  };

  # FIXME: cannot find awesome libraries
  propagatedBuildInputs = [ pulseaudio_dbus ];

  buildPhase = ":";

  installPhase = ''
    mkdir -p "$out/share/lua/${lua.luaversion}"
    cp -r ${pname}.lua "$out/share/lua/${lua.luaversion}/"
  '';

}
