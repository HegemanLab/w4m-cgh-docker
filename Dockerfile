# 'Pisces' Galaxy - W4M 3.0.x
#
# based on W4m VERSION  3.0.x
#   for which DockerFile and build transcript, with tag 'd79e598c4975', are at:
#     https://hub.docker.com/r/workflow4metabolomics/galaxy-workflow4metabolomics/builds/bgvhvblrfeu3m8fmikqruvf/

# from W4m 3.0.x (see above)
FROM workflow4metabolomics/galaxy-workflow4metabolomics@sha256:a6ff8ecd87a90d7717e58edff355e504355085ed1f8195f722169f2fcb229360

MAINTAINER Arthur C. Eschenlauer, esch0041@umn.edu

ENV GALAXY_CONFIG_BRAND=W4M-3.0.x-CGH

# add rsync package
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends rsync

# Install Tools
ADD w4m-config/tool_list_CGH.yaml $GALAXY_ROOT/tools_CGH.yaml
RUN cat $GALAXY_ROOT/tools_CGH.yaml >> $GALAXY_ROOT/tools.yaml
RUN install-tools $GALAXY_ROOT/tools.yaml

RUN sed -i 's/# object_store_config_file =/object_store_config_file =/' /etc/galaxy/galaxy.ini
