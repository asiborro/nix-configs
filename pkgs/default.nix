final: prev:

{
  monocraft = prev.callPackage ./monocraft { };
  nvim-ts-grammars = prev.callPackage ./nvim-ts-grammars { };
  oktoast = prev.callPackage ./oktoast { };
  pizzabox = prev.callPackage ./pizzabox { };
  # python3Packages = prev.python3Packages // {
  #   jsons = prev.callPackage ./jsons { };
  # };
  toast-services = prev.callPackage ./toast-services { };
  # vimPlugins = prev.vimPlugins // {
  #   gitsigns-nvim = prev.callPackage ./gitsigns-nvim { };
  # };
}
