FROM selenium/standalone-chrome:3.5.3-astatine

USER seluser

COPY entry_point.sh /opt/bin/entry_point.sh

EXPOSE 4444
