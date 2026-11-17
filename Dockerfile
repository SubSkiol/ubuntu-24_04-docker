FROM osrf/ros:jazzy-desktop

# Install stuff and things that will be useful
RUN apt-get update && apt-get install -y \
		build-essential \
		cmake \
		git \
		python3-pip \ 
		python3-rosdep \
		python3-colcon-common-extensions \
		zsh \
		7zip \
		eza \
		zoxide \
		fzf \
		grep \
		neovim \
		ssh \
		tmux \
		bat \
		&& rm -rf /var/lib/apt/lists/*

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=1000

# Yoink the Ubuntu user bc I want the UID/GID.
RUN usermod --login $USERNAME ubuntu \
    && groupmod --new-name $USERNAME ubuntu \
    && usermod --gid $USER_GID --shell /usr/bin/zsh $USERNAME \
    && usermod --move-home --home /home/$USERNAME $USERNAME

# No more sudo password. I have no idea what the default would be.
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" \
    > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER ros
WORKDIR /home/ros

CMD ["zsh"]
