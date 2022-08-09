FROM ubuntu:20.04

RUN apt-get update && \ 
    apt-get install iptables iputils-ping net-tools iproute2 tcpdump vim sudo git curl python3 python3-pip -y

RUN pip3 install --upgrade pip && pip3 install webauthn flask ecdsa six
COPY test_env/ /usr/src/test_env

WORKDIR /usr/src/test_env

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]

