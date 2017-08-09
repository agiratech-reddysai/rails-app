default["ruby-install"]["git_url"] = "https://github.com/postmodern/ruby-install.git"
default["ruby-install"]["git_ref"] = "v0.6.1"
default["ruby-install"]["install_path"] = "/opt/ruby-install"
default["ruby-install"]["rubies"] = [
      {
        ruby: "ruby 2.4.1",
        user: "root",
        group: "root",
        reinstall: true
      }
    ]
