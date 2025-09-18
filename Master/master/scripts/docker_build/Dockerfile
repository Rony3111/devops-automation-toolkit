# Ì¥Å Start FROM your previously built custom image
FROM ronystark/mysql_dump_img:latest

# ‚úÖ Add HEALTHCHECK for MariaDB
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD mysqladmin ping -u root -p12shroot || exit 1

