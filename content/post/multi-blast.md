---
title: "Multi-blast and parallel processing"
date: 2022-02-10T20:57:39+01:00
draft: false
tags: ["bioinformatics", "python"]
categories: ["2022"]
---

Last year I was involved in running long series of blast of individual DNA sequences against one or more reference genome or ITS therein. For instance, I would be given a multi-fasta file with hundreds of ITS from fungi species which I have to blast individually against a builtin database of fungi ITS. I call this "multi-blast" but I'm not a bioinformatician and there might be a better term. The idea is to find the closest match for each sequence to the ones already available in our in-house database. Even if those individual sequences are not really big (400 to 800 bp), this is an embarassly parallel problem, which can be solved using Python multiprocessing capabilities or GNU [parallel](https://www.gnu.org/software/parallel/).

The following code uses Python, but since GNU parallel is invoked via a shell subprocess, it doesn't really matter. Here is a simple function to perform blast queries in parallel:

```python
import os


def parallel_blast_its(file, db):
    """Parallelized version of one-against-all Blast"""
    cmd = (
        "parallel --recstart '>' --recend '\n' -N 1 --pipe "
        + "blastn -query - -out '"
        + file
        + "_{#}' "
        + " -outfmt 0 -max_target_seqs 5 -db "
        + db
        + " < "
        + file
    )
    os.system(cmd)
```

The key here is how to pass individual record from a multi-fasta file to GNU parallel. This is done by specifying `recstart` and `recend` options, which allow to pass a raw string to blastn as for the sequence and then output each result in a temporary folder (`out`) with the name of the original multi-fasta file suffixed with the record number.

And here's a complete program to blast individual sequence from a multi-fasta file against a reference db, which was used for a metagenomics study:

```python
import multiprocessing
import os
import random

from Bio import SeqIO

SAMPLES = "representatives.fasta"
CPUS = multiprocessing.cpu_count()
PARA = False


def chunks(lst, n):
    for i in range(0, len(lst), n):
        yield lst[i : i + n]


def blast(record):
    for r in record:
        key = str(r.id).split(";")[0]
        SeqIO.write(r, "out/tmp.fasta", "fasta")
        cmd = (
            "blastn -num_threads 4 -out out/blast/"
            + key
            + " -outfmt 0"
            + " -db db/db-its-2020-12 -query out/tmp.fasta"
            + " -evalue 1e-60 -qcov_hsp_perc 90 -max_target_seqs 1 2>/dev/null"
        )
        os.system(cmd)


if __name__ == "__main__":
    records = list(SeqIO.parse(SAMPLES, "fasta"))
    if PARA:
        nc = int(len(records) / CPUS - 2)
        data = chunks(records, nc)
        p = multiprocessing.Pool(processes=CPUS - 2)
        result = [p.apply_async(blast, args=(list(x),)) for x in data]
        result = [item.get() for item in result]
    else:
        blast(records)
```

The idea is to write each DNA sequence as a Fasta file in a temporary directory, and to process it from there using `blastn`. Note that we could use the `subprocess` module instead of `os`. Likewise, the Biopython is only used to read Fasta files. Given the standardized format of those files, it would be easy to write a custom parser.

{{% music %}}Metallica • _Nothing Else Matters_{{% /music %}}
