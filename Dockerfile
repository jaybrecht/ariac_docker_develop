FROM osrf/ros:iron-desktop-full

SHELL ["/bin/bash", "-c"]

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu 

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ubuntu

WORKDIR /home/ubuntu

RUN mkdir -p /home/ubuntu/ariac_ws/src

WORKDIR /home/ubuntu/ariac_ws

RUN source /opt/ros/iron/setup.bash && \
    sudo apt-get update -qq && \
    sudo apt-get install python3-pip -y && \
    pip install setuptools==58.2.0 && \
    git clone https://github.com/usnistgov/ARIAC.git src/ARIAC && \
    git clone https://github.com/usnistgov/nist_competitor.git src/nist_competitor && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -y && \
    colcon build

RUN echo 'source /home/ubuntu/ariac_ws/install/setup.bash' >> /home/ubuntu/.bashrc 