# 'Leo' Galaxy - W4M 3.2
#
# based on W4m VERSION  3.2, but neither Dockerfile nor build transcript are available
# #  for which DockerFile and build transcript, with tag 'deadbeefdead', are at:
# #    https://hub.docker.com/r/workflow4metabolomics/galaxy-workflow4metabolomics/builds/deadbeefdeadbeefdeadbeef/

# from W4m 3.2 (see above)
#FROM workflow4metabolomics/galaxy-workflow4metabolomics@sha256:deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
FROM galaxy-workflow4metabolomics:2018dec06

MAINTAINER Arthur C. Eschenlauer, esch0041@umn.edu

ENV GALAXY_CONFIG_BRAND=W4M-3.2-CGH

# Install Tools
ADD w4m-config/tool_list_CGH.yaml $GALAXY_ROOT/tools_CGH.yaml
RUN cat $GALAXY_ROOT/tools_CGH.yaml >> $GALAXY_ROOT/tools.yaml
RUN install-tools $GALAXY_ROOT/tools.yaml

RUN pip install --upgrade setuptools

# add s3cmd
RUN cd /tmp && \
  wget https://github.com/s3tools/s3cmd/releases/download/v2.0.0/s3cmd-2.0.0.tar.gz && \
  tar xzf s3cmd-2.0.0.tar.gz && \
  cd s3cmd-2.0.0 && \
  python setup.py install

RUN sed -i 's/# object_store_config_file =/object_store_config_file =/' /etc/galaxy/galaxy.ini
RUN sed -i 's/#[ ]*tool_config_file =/tool_config_file =/' /etc/galaxy/galaxy.ini

# Use CVS to support pg_dumpall efficiently
RUN apt-get update && apt-get install -y cvs
