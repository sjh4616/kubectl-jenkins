# 쿠버네티스에서 실행하는 Jenkins   
Jenkins 내부에 kubectl 설치하는 버전   

- git clone <리포지터리 주소>
- cd kubectl-jenkins   
- docker build -t jenkins:latest .   

# Linux에서 스크립트 파일을 실행할 때 오류가 발생하면
- sudo apt install dos2unix -y   
- sudo dos2unix jenkins-in-docker-install.sh   
