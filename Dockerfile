# Escolhendo uma imagem Debian
FROM debian:11.6

# Não interromper a instalação para fazer perguntas
ENV DEBIAN_FRONTEND noninteractive

# Argumento para a versão do PHP
ARG PHP_VERSION=8.3
#ARG UID
#ARG GID

# Argumento para o fuso horário
ARG TIMEZONE=America/Sao_Paulo

# Atualizar e instalar dependências
RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    apt-transport-https \
    lsb-release \
    wget \
    curl \
    tzdata && \
    curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    mariadb-client \
    apache2 \
    php${PHP_VERSION} \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-ldap \
    php${PHP_VERSION}-xmlrpc \
    php${PHP_VERSION}-imap \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-xml \
    php-cas \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-bz2 \
    php${PHP_VERSION}-redis \
    cron \
    jq \
    libldap-2.4-2 \
    libldap-common \
    libsasl2-2 \
    libsasl2-modules \
    libsasl2-modules-db \
    vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configurar o fuso horário
ENV TZ=${TIMEZONE}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Configurar demais variaveis de ambiente
ENV GLPI_LANG="pt_BR"
ENV VERSION="10.0.10"
ENV GLPI_MARKETPLACE_DIR=/var/www/html/marketplace
ENV GLPI_VAR_DIR=/var/lib/glpi
ENV GLPI_DOC_DIR=/var/lib/glpi
ENV GLPI_CRON_DIR=/var/lib/glpi/_cron
ENV GLPI_DUMP_DIR=/var/lib/glpi/_dumps
ENV GLPI_GRAPH_DIR=/var/lib/glpi/_graphs
ENV GLPI_LOCK_DIR=/var/lib/glpi/_lock
ENV GLPI_LOG_DIR=/var/lib/glpi/_log
ENV GLPI_PICTURE_DIR=/var/lib/glpi/_pictures
ENV GLPI_PLUGIN_DOC_DIR=/var/lib/glpi/_plugins
ENV GLPI_RSS_DIR=/var/lib/glpi/_rss
ENV GLPI_SESSION_DIR=/var/lib/glpi/_sessions
ENV GLPI_TMP_DIR=/var/lib/glpi/_tmp
ENV GLPI_UPLOAD_DIR=/var/lib/glpi/_uploads
ENV GLPI_CACHE_DIR=/var/lib/glpi/_cache
ENV GLPI_CONFIG_DIR=/etc/glpi/config
ENV MARIADB_HOST="mariadb"
ENV MARIADB_PORT="3306"
ENV MARIADB_DATABASE="glpi"
ENV MARIADB_USER="glpi"
ENV MARIADB_PASSWORD="glpi"
ENV MARIADB_RANDOM_ROOT_PASSWORD="1"

# Adicionar configuração de segurança para sessões
RUN echo "session.cookie_httponly = on" >> /etc/php/${PHP_VERSION}/apache2/php.ini

# Copiar e executar o script de inicialização para instalação e inicialização do GLPI
COPY scripts/glpi-start.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/glpi-start.sh

# RUN /usr/local/bin/glpi-criar-diretorios.sh \
#    && /usr/local/bin/glpi-configurar-banco.sh

# Configuração do ponto de entrada
ENTRYPOINT ["/usr/local/bin/glpi-start.sh"]

WORKDIR /var/www/html/glpi

# RUN addgroup --gid $GID nonroot && \
#     adduser --uid $UID --gid $GID --disabled-password --gecos "" nonroot && \
#     echo 'nonroot ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# USER nonroot

# Exposição das portas
EXPOSE 80