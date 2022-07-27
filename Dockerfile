FROM homebrew/ubuntu16.04:latest

RUN brew install zsh vim
COPY chsh /etc/pam.d/
RUN sudo sh -c "echo '/home/linuxbrew/.linuxbrew/bin/zsh' >> /etc/shells"
RUN chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
RUN brew install olets/tap/zsh-abbr
RUN git clone https://github.com/n3xem/dotfiles.git && cd dotfiles && sh init.sh
RUN brew install rust
RUN brew install exa


CMD /home/linuxbrew/.linuxbrew/bin/zsh

