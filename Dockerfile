FROM docker.io/library/archlinux:latest

ARG user

RUN pacman-key --init

RUN pacman -Syyu --noconfirm

RUN pacman -S --noconfirm make git

RUN pacman -S --noconfirm tmux
RUN pacman -S --noconfirm \
    neovim \
    ripgrep fd wget luarocks \
    python-pynvim \
    python-pip

RUN pacman -S --noconfirm base-devel openssl zlib xz tk
RUN pacman -S --noconfirm pyenv


RUN pacman -S --noconfirm rustup
RUN pacman -S --noconfirm lldb

RUN pacman -S --noconfirm nodejs npm
RUN npm install -g neovim

RUN pacman -S --noconfirm go
RUN pacman- S --noconfirm r

RUN pacman -S --noconfirm sudo

RUN pacman -S --noconfirm pacman-contrib
# RUN paccache -rk0

RUN echo " %wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel
RUN visudo -c /etc/sudoers.d/wheel
RUN useradd -m -G wheel $user

USER $user

VOLUME /home/$user

RUN rustup default stable
RUN rustup component add rust-analyzer

# RUN mkdir -p ~/.tmux/plugins \
#     && mkdir -p ~/.config/tmux \
#     && wget -P ~/.config/tmux https://github.com/the-citto/tmux-conf/raw/refs/heads/main/tmux.conf


# RUN pacman -Syyu --noconfirm \
#     && pacman -S --noconfirm --needed \
#         pacman-contrib \
#         git \
#         make \
#         tmux \
#         neovim \
#         ripgrep fd wget luarocks npm nodejs \
#     && npm install -g \
#         tree-sitter-cli \
#         neovim \
#     && paccache -rk0



