FROM debian
LABEL name=anujp-dev-example
RUN apt-get update && apt-get install -y \
				sudo \
        git \
				zsh \
				ruby \
        curl \
        wget \
				python3-pip

RUN useradd -ms /bin/zsh anujp
RUN echo "anujp ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/anujp && \
    chmod 0440 /etc/sudoers.d/anujp
USER anujp
RUN cd /home/anujp && git clone https://github.com/anuj1102/setupenv.git
