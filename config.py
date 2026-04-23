# ================================================
# Config updated by: Muhammad Humza Majeed & Muhammad Moeed Ikram
# Date: 2026-04-22
# Changes: Updated DB host, added connection timeout
#          and health check interval
# Conflict resolved: kept sakila-db-server as host,
#                    retained both new variables
# ================================================
import os

class Config:

    MYSQL_HOST = os.environ.get('MYSQL_HOST', 'sakila-db-server')
    MYSQL_USER = os.environ.get('MYSQL_USER', 'root')
    MYSQL_PASSWORD = os.environ.get('MYSQL_PASSWORD', 'admin')
    MYSQL_DB = os.environ.get('MYSQL_DB', 'sakila')
    SECRET_KEY = os.environ.get('SECRET_KEY', 'your-secret-key-here-change-this-in-production')
    CONNECTION_TIMEOUT = int(os.environ.get('CONNECTION_TIMEOUT', '10'))
    HEALTH_CHECK_INTERVAL = int(os.environ.get('HEALTH_CHECK_INTERVAL', '10'))

