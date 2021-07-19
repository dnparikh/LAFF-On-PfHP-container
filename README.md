# LAFF-On - Programming for High Performance Docker Container

docker build -t laff-on-pfhp --build-arg USER_ID=1001 --build-arg GROUP_ID=1001 --build-arg USERNAME=dnparikh .

docker run -it -v /home/dnparikh/work/LAFF-On-PfHP/Assignments:/home/dnparikh/Assignments  laff-on-pfhp:latest bash
