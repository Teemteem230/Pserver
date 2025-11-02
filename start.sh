#!/bin/bash

# إنشاء كلمة المرور
htpasswd -cb /etc/squid/passwords admin ${PROXY_PASSWORD:-default_password_123}

# إنشاء مجلد الكاش
mkdir -p /var/spool/squid
chown -R proxy:proxy /var/spool/squid

# تهيئة الكاش
squid -z

# تشغيل سكويد
exec squid -N -d 1