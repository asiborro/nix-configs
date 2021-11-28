{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [
        pkgs.jdk11
        pkgs.gradle
        pkgs.java-language-server
    ];
}
