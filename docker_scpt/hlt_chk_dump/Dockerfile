# Custom image which includes the mysql dump
FROM ronystark/mysql_dump_img:latest

# Add HEALTHCHECK to monitor MariaDB status
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD mysqladmin ping -u root -p12shroot || exit 1

