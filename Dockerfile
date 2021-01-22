FROM harbor.stormsend.tkg-vsphere-lab.winterfell.live/eduk8s/base-image

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

RUN fix-permissions /home/eduk8s
