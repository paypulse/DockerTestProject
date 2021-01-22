# Dockerfile은 FROM instruction으로 시작해야 한다.
# build하는 image의 parent image를 지정한다.
# 단지 하나 이상의 ARG  instruction이 앞설수 있다.
FROM python:2.7-slim

#현재 docker file이 있는 위치
WORKDIR /app 

#working directory 안에 추가 
ADD . /app

#python package manager 역할: node의 npm 역할을 하는 역할
RUN pip install --trusted-host pypi.python.org -r requirements.txt

#open port
EXPOSE 80

# 환경 변수
ENV NAME World

ARG test_flag
# ARG test_flag='hello'
RUN echo "Argument test_flag value: ${test_flag}"

LABEL version="1.0"
# VOLUME "/var/lib/docker/volumes/myvol/_data"

#python 의 app.py를 실행 하겠다. 
CMD ["python", "app.py"]