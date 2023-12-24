![GLPI Logo](https://raw.githubusercontent.com/glpi-project/glpi/master/pics/logos/logo-GLPI-250-black.png)
## GLPI Containers

Arquivos de manifesto para realizar build e deploy do GLPI em containers usando o Docker.

https://github.com/feesteves/glpi


## Sobre o GLPI
GLPI stands for Gestionnaire Libre de Parc Informatique is a Free Asset and IT Management Software package, that provides ITIL Service Desk features, licenses tracking and software auditing.

https://github.com/glpi-project/glpi


## Suporte:

https://www.fcti.com.br

contato@fcti.com.br


## Variaveis de Ambiente (Environments):

ENV GLPI_LANG="pt_BR"

ENV VERSION="10.0.10"

ENV GLPI_MARKETPLACE_DIR=/var/www/html/marketplace

ENV GLPI_VAR_DIR=/var/lib/glpi

ENV GLPI_DOC_DIR=/var/lib/glpi

ENV GLPI_CRON_DIR=/var/lib/glpi/\_cron

ENV GLPI_DUMP_DIR=/var/lib/glpi/\_dumps

ENV GLPI_GRAPH_DIR=/var/lib/glpi/\_graphs

ENV GLPI_LOCK_DIR=/var/lib/glpi/\_lock

ENV GLPI_LOG_DIR=/var/lib/glpi/\_log

ENV GLPI_PICTURE_DIR=/var/lib/glpi/\_pictures

ENV GLPI_PLUGIN_DOC_DIR=/var/lib/glpi/\_plugins

ENV GLPI_RSS_DIR=/var/lib/glpi/\_rss

ENV GLPI_SESSION_DIR=/var/lib/glpi/\_sessions

ENV GLPI_TMP_DIR=/var/lib/glpi/\_tmp

ENV GLPI_UPLOAD_DIR=/var/lib/glpi/\_uploads

ENV GLPI_CACHE_DIR=/var/lib/glpi/\_cache

ENV GLPI_CONFIG_DIR=/etc/glpi/config

ENV MARIADB_HOST="mariadb"

ENV MARIADB_PORT="3306"

ENV MARIADB_DATABASE="glpi"

ENV MARIADB_USER="glpi"

ENV MARIADB_PASSWORD="glpi"

## Licença

![license](https://img.shields.io/github/license/glpi-project/glpi.svg)
