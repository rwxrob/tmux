FROM conanio/gcc10
USER root
RUN apt update -y && apt install -y libevent-dev build-essential bison && \
    git clone http://github.com/tmux/tmux && \
    cd tmux && perl -p -i -e 's, xqlkmjwvtun~,             ,' screen-redraw.c && \
    sh autogen.sh && ./configure && make && make install
COPY Dockerfile entrypoint /
ENTRYPOINT ["sh","/entrypoint"]
