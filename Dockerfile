FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    linux-headers-generic \
    libxml2-dev \
    libncurses5-dev \
    uuid-dev \
    libjansson-dev \
    sqlite3 \
    libsqlite3-dev \
    git \
    autoconf \
    automake \
    libtool \
    bison \
    flex \
    unixodbc \
    unixodbc-dev \
    curl \
    libasound2-dev \
    lua5.3 \
    libedit-dev \
    libssl-dev \
    wget

# Download and install MySQL ODBC connector with dependencies
RUN wget https://dev.mysql.com/get/Downloads/Connector-ODBC/8.4/mysql-connector-odbc_8.4.0-1ubuntu24.04_amd64.deb && \
    wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-community-client-plugins_8.0.26-1ubuntu20.04_amd64.deb && \
    dpkg -i mysql-community-client-plugins_8.0.26-1ubuntu20.04_amd64.deb && \
    dpkg -i mysql-connector-odbc_8.4.0-1ubuntu24.04_amd64.deb && \
    rm mysql-community-client-plugins_8.0.26-1ubuntu20.04_amd64.deb mysql-connector-odbc_8.4.0-1ubuntu24.04_amd64.deb

# Create asterisk group and user
RUN groupadd asterisk && \
    useradd -r -g asterisk asterisk

RUN echo "asterisk:fuconfig" | chpasswd

# Download and extract Asterisk source code
RUN curl -o /tmp/asterisk.tar.gz https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20-current.tar.gz && \
    mkdir -p /usr/src/asterisk && \
    tar -xzf /tmp/asterisk.tar.gz -C /usr/src/asterisk --strip-components=1

# Configure Asterisk
RUN cd /usr/src/asterisk && \
    ./configure

# Run menuselect
RUN cd /usr/src/asterisk && \
    make menuselect.makeopts && \
    menuselect/menuselect --disable astdb2sqlite3 menuselect.makeopts && \
    menuselect/menuselect --disable astdb2bdb menuselect.makeopts && \
    menuselect/menuselect --enable res_odbc menuselect.makeopts && \
    menuselect/menuselect --enable res_config_odbc menuselect.makeopts && \
    menuselect/menuselect --enable res_resolver_unbound menuselect.makeopts && \
    menuselect/menuselect --enable res_hep menuselect.makeopts && \
    menuselect/menuselect --enable res_hep_rtcp menuselect.makeopts && \
    menuselect/menuselect --enable res_hep_pjsip menuselect.makeopts && \
    menuselect/menuselect --enable res_calendar menuselect.makeopts && \
    menuselect/menuselect --enable app_agent_pool menuselect.makeopts && \
    menuselect/menuselect --enable cdr_sqlite3_custom menuselect.makeopts && \
    menuselect/menuselect --enable cel_sqlite3_custom menuselect.makeopts && \
    menuselect/menuselect --enable cdr_manager menuselect.makeopts && \
    menuselect/menuselect --enable pbx_lua menuselect.makeopts && \
    menuselect/menuselect --enable res_http_media_cache menuselect.makeopts && \
    menuselect/menuselect --enable app_voicemail_imap menuselect.makeopts && \
    menuselect/menuselect --enable app_festival menuselect.makeopts && \
    menuselect/menuselect --enable pbx_config menuselect.makeopts && \
    menuselect/menuselect --enable pbx_ael menuselect.makeopts && \
    menuselect/menuselect --enable res_prometheus menuselect.makeopts

# Build and install Asterisk
RUN cd /usr/src/asterisk && \
    make && \
    make install && \
    make install-headers

RUN echo "Creating DB directory"

# Ensure /var/lib/asterisk exists and has the correct permissions


# Clone, build, and install chan_sccp
RUN git clone https://github.com/chan-sccp/chan-sccp.git /usr/src/chan-sccp && \
    cd /usr/src/chan-sccp && \
    ./configure --with-asterisk=/usr && \
    make && \
    make install

# Create the directory and copy asterisk-scripts
RUN mkdir -p /asterisk_scripts
COPY ./asterisk-scripts/ /asterisk_scripts/

# Expose necessary ports
EXPOSE 5060/tcp 5061/tcp 5060/udp 2000/tcp 5038/tcp
EXPOSE 10000-20000/udp

# Ensure Asterisk database directory exists and has the correct permissions
# Ensure /var/lib/asterisk and /var/run/asterisk exist and have the correct permissions
RUN mkdir -p /var/lib/asterisk /var/run/asterisk && \
    touch /var/lib/asterisk/astdb.sqlite3 && \
    chown -R asterisk:asterisk /var/lib/asterisk /var/run/asterisk

# Start Asterisk in the foreground - Right?
CMD ["asterisk", "-U", "root", "-G", "asterisk", "-f", "-c", "-vvv"]