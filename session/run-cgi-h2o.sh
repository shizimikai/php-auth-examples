#!/bin/bash

cd "$(dirname "$0")"

h2o -c <(cat <<'EOD'
listen: 8080
file.index: ['index.php', 'index.html']
file.custom-handler:
  extension: .php
  fastcgi.spawn: "PHP_FCGI_CHILDREN=10 exec php-cgi"
hosts:
  "localhost:8080":
    paths:
      /:
        file.dir: .
EOD)
