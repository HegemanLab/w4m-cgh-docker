# Galaxy `Pisces`(W4M 3.0) 

The `Pisces` Galaxy (W4M 3.0) was custom-built with the code here and the command

```docker build -t galaxy-w4m-3.0.x-cgh .```

# Galaxy `Carina` and `Workshop` (W4M 3.0) 

The `Carina` and `Workshop` Galaxies (W4M 3.0) were not custom-built; rather, they were stock-installs of W4M 3.0, specifically:
```bash
docker pull workflow4metabolomics/galaxy-workflow4metabolomics@sha256:a6ff8ecd87a90d7717e58edff355e504355085ed1f8195f722169f2fcb229360
```

# Galaxy `Fornax` (W4M 2.5)

(Re)build W4M docker with tools customized for the Cohen Gardner Hegeman labs group

See https://github.com/HegemanLab/w4m-cgh-docker/releases/tag/fornax which documents how the 'Fornax' Galaxy (based on W4M 2.5.2) was built and could be reconstructed.
