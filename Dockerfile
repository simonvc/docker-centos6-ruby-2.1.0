# Centos omnibus build image

FROM centos

RUN wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

RUN yum remove ruby

# Install dependencies
RUN yum -y groupinstall "Development Tools"
RUN yum -y install zlib zlib-devel
RUN yum -y install openssl-devel
RUN wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
RUN tar xzvf yaml-0.1.4.tar.gz
RUN cd yaml-0.1.4/ && ./configure && make && make install

RUN wget http://ftp.ruby-lang.org/pub/ruby/stable/ruby-2.1.0.tar.gz
RUN tar zvxf ruby-2.1.0.tar.gz
RUN cd ruby-2.1.0 && ./configure && make && make install

RUN gem update --system
RUN gem install bundler --no-rdoc --no-ri
