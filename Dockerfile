FROM ubuntu:18.04

COPY assets /assets
RUN /assets/setup.sh

FROM wnameless/oracle-xe-11g-r2

ADD /assets/1_script_creacion_tbsp.sql /docker-entrypoint-initdb.d/
ADD /assets/2_script_creacion_users.sql /docker-entrypoint-initdb.d/
ADD /assets/3_script_creacion_objs.sql /docker-entrypoint-initdb.d/
ADD /assets/4_script_perm_objs.sql /docker-entrypoint-initdb.d/
ADD /assets/5_script_datos.sql /docker-entrypoint-initdb.d/
ADD /assets/6_script_creacion_tbsp_historico.sql /docker-entrypoint-initdb.d/
ADD /assets/7_script_creacion_usershistorico.sql /docker-entrypoint-initdb.d/
ADD /assets/8_script_creacion_objs_historico.sql /docker-entrypoint-initdb.d/
ADD /assets/9_script_perm_objs_historico.sql /docker-entrypoint-initdb.d/

EXPOSE 22
EXPOSE 1521
EXPOSE 8080

CMD /usr/sbin/startup.sh && tail -f /dev/null