FROM sameersbn/squid:3.5.27-2

# تثبيت حزم إضافية
RUN apt-get update && apt-get install -y \
    apache2-utils \
    && rm -rf /var/lib/apt/lists/*

# نسخ ملف الإعدادات
COPY squid.conf /etc/squid/squid.conf
COPY start.sh /start.sh

# جعل سكريبت التشغيل قابل للتنفيذ
RUN chmod +x /start.sh

# المنافذ المكشوفة
EXPOSE 3128 3129

CMD ["/start.sh"]