FROM ubuntu

#RUN apt install software-properties-common
RUN apt-get update
RUN apt-get install -y python3.8
RUN apt-get install -y curl
RUN apt-get install -y python3-distutils
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.8 get-pip.py
WORKDIR /root/

RUN pip install appium-Python-Client==1.2.0
RUN pip install  pebble==4.6.3
RUN pip install  pyNaCl==1.4.0
RUN pip install  speechRecognition==3.8.1
RUN pip install  allure-pytest==2.8.12
RUN pip install  allure-python-commons==2.8.12
RUN pip install  atomicwrites==1.4.0
RUN pip install  attrs==21.2.0
RUN pip install  bcrypt==3.2.0
RUN pip install  cachetools==4.2.2
RUN pip install  certifi==2021.5.30
RUN pip install  cffi==1.14.6
RUN pip install  charset-normalizer==2.0.4
RUN pip install  colorama==0.4.4
RUN pip install  cryptography==3.4.8
RUN pip install  decorator==5.0.9
RUN pip install  docutils==0.17.1
RUN pip install  execnet==1.9.0
RUN pip install  future==0.18.2
RUN pip install  google-api-core==1.16.0
RUN pip install  google-auth==1.12.0
RUN pip install  google-cloud-core==1.3.0
RUN pip install  google-cloud-translate==2.0.1
RUN pip install  googleapis-common-protos==1.51.0
RUN pip install  grpcio==1.40.0
RUN pip install  grpcio-tools==1.40.0
RUN pip install  idna==3.2
RUN pip install  kitchen==1.2.6
RUN pip install  more-itertools==8.9.0
RUN pip install  numpy==1.21.2
RUN pip install  packaging==21.0
RUN pip install  paho-mqtt==1.5.0
RUN pip install  paramiko==2.7.1
RUN pip install  pluggy==0.13.1
RUN pip install  protobuf==3.11.3
RUN pip install  psutil==5.8.0
RUN pip install  py==1.10.0
RUN pip install  pyasn1==0.4.8
RUN pip install  pyasn1-modules==0.2.8
RUN pip install  pycparser==2.20
RUN pip install  pyparsing==2.4.7
RUN pip install  pyserial==3.4
RUN pip install  pytest==5.4.3
RUN pip install  pytest-forked==1.1.3
RUN pip install  pytest-logger==0.5.1
RUN pip install  pytest-repeat==0.8.0
RUN pip install  pytest-rerunfailures==9.0
RUN pip install  pytest-timeout==1.3.4
RUN pip install  pytest-xdist==1.31.0
RUN pip install  python-dateutil==2.8.1
RUN pip install  pytz==2021.1
RUN pip install  requests==2.26.0
RUN pip install  robotframework==3.1.2
RUN pip install  robotframework-appiumlibrary==1.5.0.4
RUN pip install  robotframework-mqttlibrary==0.7.0
RUN pip install  robotframework-seleniumlibrary==4.3.0
RUN pip install  robotframework-sshlibrary==3.4.0
RUN pip install  rsa==4.0
RUN pip install  scp==0.14.0
RUN pip install  selenium==3.141.0
RUN pip install  setuptools==47.1.0
RUN pip install  singleton-decorator==1.0.0
RUN pip install  six==1.16.0
RUN pip install  urllib3==1.25.8
RUN pip install  vbf-parser==1.4.0
RUN pip install  wcwidth==0.2.5
RUN pip install  wheel==0.37.0
RUN pip install  xlrd==1.2.0
RUN pip install  zipp==3.1.0
RUN pip install  zope.interface==5.0.2

RUN pip install  artifactory

RUN apt-get install -y clang
RUN apt-get install -y nuget
RUN pip install pycparser
RUN apt-get install -y apt-transport-https
RUN apt-get install wget
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.1
RUN apt-get install -y dotnet-runtime-3.1
RUN apt-get install -y net-tools

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd 
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -i 's/#Port 22/Port 1025/g' /etc/ssh/sshd_config

RUN apt-get install -y openjdk-8-jre
RUN apt-get install -y git
RUN mkdir -p /root/.ssh
COPY .ssh/* /root/.ssh/
RUN echo "LogLevel=quiet" > .ssh/config
RUN chmod 700 /root/.ssh
RUN chmod 700 /root/.ssh/*

RUN apt-get install -y iputils-ping
RUN apt-get install -y sudo
RUN apt-get install -y vim
RUN git clone "ssh://svc_tbuinte@gerrit1.harman.com:29418/int_tpf/tcam2_test" && scp -p -P 29418 svc_tbuinte@gerrit1.harman.com:hooks/commit-msg "tcam2_test/.git/hooks/"
RUN service ssh start
RUN apt-get install -y adb
RUN apt-get install -y tshark
# RUN apt-get install -y dlt-daemon

EXPOSE 1025


CMD ["/usr/sbin/sshd","-D"]


### some requirements.
# file /etc/sysctl.conf
# add  -- net.ipv4.ip_unprivileged_port_start=22