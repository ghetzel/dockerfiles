FROM python:3.7
RUN apt-get -qqy update && apt-get -qqy install yarnpkg
RUN apt-get clean
RUN pip install --upgrade pip && pip install pipenv flake8 flake8-html werkzeug
RUN pip cache purge
RUN ln -s /usr/bin/yarnpkg /usr/bin/yarn
RUN curl -o- -vfL --max-time 10 https://raw.githubusercontent.com/serverless/serverless/master/scripts/pkg/install.sh | VERSION=2.21.1 bash
RUN chmod +x /root/.serverless/bin/*
RUN mv -v /root/.serverless/bin/* /usr/bin/
RUN rmdir /root/.serverless/bin /root/.serverless