# Galaxy - W4M
#
# VERSION       2.5.2.0-17.01

#FROM quay.io/bgruening/galaxy:jmc_conda
#FROM quay.io/bgruening/galaxy:release_17.01
#FROM workflow4metabolomics/galaxy-workflow4metabolomics
FROM workflow4metabolomics/galaxy-workflow4metabolomics@sha256:0093395ccb87413b4d2aed023e205afd47c77ccd6c4412eab6a8430bc23a9206


MAINTAINER Arthur C. Eschenlauer, esch0041@umn.edu

ENV GALAXY_CONFIG_BRAND=W4M-CGH

# add rsync package
RUN apt-get update && apt-get install -y --no-install-recommends rsync

# Install Tools
ADD w4m-config/tool_list_CGH.yaml $GALAXY_ROOT/tools_CGH.yaml
RUN cat $GALAXY_ROOT/tools_CGH.yaml >> $GALAXY_ROOT/tools.yaml
RUN install-tools $GALAXY_ROOT/tools.yaml

