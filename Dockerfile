FROM node:16

RUN mkdir -p /projects

# # install yarn
# RUN npm install -g yarn
RUN wget -qO- https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable-4.8/openshift-client-linux.tar.gz | tar xvz -C /usr/local/bin && \
    oc version --client && \
    echo "Installed oc"

RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.22.1/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq && \
    echo "Installed yq"
RUN apt-get update
RUN apt-get install -y chromium tzdata
RUN cp /usr/share/zoneinfo/Europe/Stockholm /etc/localtime

WORKDIR /projects
