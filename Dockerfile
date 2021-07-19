FROM ubuntu

ARG USER_ID
ARG GROUP_ID
ARG USERNAME

RUN apt-get update
RUN apt-get install -y gcc git make python-is-python3 vim

RUN addgroup --gid $GROUP_ID $USERNAME
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USERNAME

WORKDIR /home/$USERNAME/libraries
RUN git clone https://github.com/flame/blis.git

WORKDIR /home/$USERNAME/libraries/blis
RUN git checkout pfhp
RUN ./configure -t openmp -p /home/$USERNAME/blis auto
RUN make -j8
RUN make check -j8
RUN make install

#RUN echo $HOME

RUN chmod a+rx /home/$USERNAME/blis

USER $USERNAME
WORKDIR /home/$USERNAME
