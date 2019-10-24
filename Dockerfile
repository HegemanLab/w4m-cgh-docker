# 'Gould' Galaxy - adapted from W4M 3.3 4 July 2019 https://github.com/workflow4metabolomics/w4m-docker/commit/277d4986eafb897ff7c7ae4874375a1b11daa9d3
#
# based on W4m VERSION  3.3, but build transcript is unavailable

# from W4m 3.2 (see above)
#FROM workflow4metabolomics/galaxy-workflow4metabolomics@sha256:deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
#FROM galaxy-workflow4metabolomics:2018dec06
FROM workflow4metabolomics/galaxy-workflow4metabolomics@sha256:966994f8cf9d4c9a9fe7ee8f858cdbcf2f9363dab38c3916e817d49e3e08404f

MAINTAINER Arthur C. Eschenlauer, esch0041@umn.edu

ENV GALAXY_CONFIG_BRAND=W4M-3.3-CGH

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
