# Galaxy `Gould` (W4M 3.3)

The `Gould` Galaxy (W4M 3.3) was custom-built with the code here and the command

```docker build -t galaxy-w4m-3.3-cgh-gould .```

Note well that the Dockerfile has been reverted to restore a comment character from galaxy.ini so that the following line is inactive.
```
#object_store_config_file = config/object_store_config.xml
```


# Galaxy `Leo` (W4M 3.2)

The `Leo` Galaxy (W4M 3.2) was custom-built with the Leo branch of the code here and the command

```docker build -t galaxy-w4m-3.2.1-cgh .```

However, because (at the time that I built it) there was no Docker image available, I had to build the FROM image from https://github.com/workflow4metabolomics/w4m-docker


# Galaxy `Pisces` (W4M 3.0)

The `Pisces` Galaxy (W4M 3.0) was custom-built with the code here and the command

```docker build -t galaxy-w4m-3.0.x-cgh .```

Note well that the Dockerfile has been changed to remove a comment character from galaxy.ini so that the following line is active.

```
object_store_config_file = config/object_store_config.xml
```

Theoretically, I should be able to set this via the environment variable
```
GALAXY_CONFIG_OBJECT_STORE_CONFIG_FILE
```
but I have been getting inconsistent results and made this change to avoid "one more moving part".

For further (albeit limited) information on configuring the object store, see the following:

* https://biostar.usegalaxy.org/p/18477/#18556
* https://github.com/galaxyproject/galaxy/blob/dev/config/object_store_conf.xml.sample


# Galaxy `Carina` and `Workshop` (W4M 3.0)

The `Carina` and `Workshop` Galaxies (W4M 3.0) were not custom-built; rather, they were stock-installs of W4M 3.0, specifically:
```bash
docker pull workflow4metabolomics/galaxy-workflow4metabolomics@sha256:a6ff8ecd87a90d7717e58edff355e504355085ed1f8195f722169f2fcb229360
```


# Galaxy `Fornax` (W4M 2.5)

(Re)build W4M docker with tools customized for the Cohen Gardner Hegeman labs group

See https://github.com/HegemanLab/w4m-cgh-docker/releases/tag/fornax which documents how the 'Fornax' Galaxy (based on W4M 2.5.2) was built and could be reconstructed.
