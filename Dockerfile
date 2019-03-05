FROM debian:9.7-slim
ENV PATH=/GTCtoVCF:$PATH
RUN set -e \
    && apt-get update \
    && apt-get install -y python3 python3-numpy python3-pysam python3-pyvcf tabix bcftools git \
    && git clone https://github.com/Illumina/GTCtoVCF.git \
    && mv GTCtoVCF/gtc_to_vcf.py GTCtoVCF/gtc_to_vcf \
    && sed -i '1 s/python/python3/' GTCtoVCF/gtc_to_vcf
