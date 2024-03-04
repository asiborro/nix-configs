{ lib
, python3Packages
, autossh
}:

python3Packages.buildPythonPackage rec {
  pname = "braid";
  version = "0.1.0";

  src = fetchGit {
    url = "git@github.com:toasttab/braid.git";
    rev = "5cd87e6a88c5151821f315dc37057b2dea687672";
    ref = "main";
  };

  doCheck = false;

  propagatedBuildInputs = with python3Packages; [
    autossh
    click
    docker
    psycopg2
    prettytable
    pyyaml
    toast-tools
    psutil
    inquirerpy
    dateutil
    parameterized
    boto3
    environs
    gitpython
    cachetools
    pylint
    texttable
  ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "version=Version().version," "version='0.1.0',"
  '';

}
