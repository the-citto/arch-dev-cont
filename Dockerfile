FROM archlinux:latest

ARG user

RUN pacman-key --init

RUN pacman -Syyu --noconfirm

RUN pacman -S --noconfirm sudo

RUN useradd -m -G wheel $user

RUN pacman -S --noconfirm \
    pacman-contrib \
    make git \
    tmux \
    neovim \
    ripgrep fd wget luarocks

RUN paccache -rk0

RUN echo " %wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

RUN visudo -c /etc/sudoers.d/wheel

USER $user

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



