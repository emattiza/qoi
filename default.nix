with import <nixpkgs> {};

stdenv.mkDerivation {
    version = "0.0.1";
    name = "qoiconv";
    nativeBuildInputs = [ pkg-config ];
    buildInputs = [ stb ];
    src = ./.;
    buildPhase = ''
        NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -isystem ${stb.src}"
        make
    '';
    installPhase = ''
        mkdir -p $out/bin
        cp qoiconv $out/bin/qoiconv
    '';
    doCheck = false;
}