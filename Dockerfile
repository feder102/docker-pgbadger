FROM sdg9670/pgbadger:latest
WORKDIR /pgbadger
ARG PGBADGER_VERSION=11.1
RUN wget -O pgbadger.tar.gz https://github.com/darold/pgbadger/archive/v${PGBADGER_VERSION}.tar.gz
RUN tar -xvzf pgbadger.tar.gz
RUN rm pgbadger.tar.gz
RUN mv pgbadger-${PGBADGER_VERSION} pgbadger
WORKDIR /pgbadger/pgbadger
RUN perl Makefile.PL
RUN make && make install
WORKDIR /pgbadger
#RUN mkdir logs
#RUN mkdir outs
WORKDIR /pgbadger/outs
CMD [ "sh", "-c", "pgbadger ${PARAMETERS} ../logs/${FILE_NAME}" ]