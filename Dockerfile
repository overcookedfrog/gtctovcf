FROM debian:10-slim
ENV PATH=/app:$PATH
WORKDIR /app
RUN set -e \
    && apt-get update \
    && apt-get install -y python3 python3-numpy python3-pysam python3-pyvcf tabix bcftools curl \
    && curl -L https://github.com/Illumina/GTCtoVCF/archive/1.2.1.tar.gz | tar xz --strip-components=1 \
    && mv gtc_to_vcf.py gtc_to_vcf \
    && rm -rf tests/ scripts/ \
    && sed -i '1 s/python/python3/' gtc_to_vcf
