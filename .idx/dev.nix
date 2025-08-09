{ pkgs, ... }:
{
  channel = "stable-23.11";

  packages = [
    pkgs.openjdk11
    pkgs.nodejs_20
    pkgs.mysql
    pkgs.maven
    pkgs.git
    pkgs.docker-compose
    pkgs.nodePackages."@angular/cli"
  ];

  env = {
    MYSQL_USER = "dev";
    MYSQL_PASSWORD = "password";
    MYSQL_DATABASE = "dev_db";
    MYSQL_PORT = "3306";
  };

  services.mysql.enable = true;

  idx = {
    extensions = [
      "angular.ng-template"
      "vscjava.vscode-java-pack"
      "redhat.java"
    ];

    workspace = {
      onCreate = {
        install = "./.idx/init-db.sh && (cd back/ && mvn clean install -DskipTests) & cd front/ && npm install";      
      };
      onStart = {
        runServer = "(cd back/ && mvn spring-boot:run) & cd front/ && ng serve";      
      };
    };
    
  };
}
