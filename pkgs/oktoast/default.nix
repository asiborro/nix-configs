{ stdenv, fetchFromGitHub, pkgs, lib }:
stdenv.mkDerivation {
  pname = "oktoast";
  version = "1.0";

  src = fetchGit {
    url = "git@github.com:toasttab/oktoast-setup.git";
    rev = "acfde386ec6cb138d0520d329f0fbe0cc6b95d4f";
  };

  nativeBuildInputs = [
    pkgs.makeWrapper
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp oktoast $out/bin
  '';

  postFixup = ''
    wrapProgram $out/bin/oktoast \
      --prefix PATH : ${lib.makeBinPath [
        pkgs.saml2aws
        # gnused installs "sed", but oktoast needs "gsed"
        (pkgs.writeShellScriptBin "gsed" "exec -a $0 ${pkgs.gnused}/bin/sed \"$@\"")
        pkgs.awscli
      ]}
  '';
}