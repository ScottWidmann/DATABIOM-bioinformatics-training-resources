# Linux and HPC Basics

This protocol summarizes the Linux command-line and HPC job-scheduling
skills taught in `lectures/01_introduction_to_bioinformatics_and_hpc.pdf`.
It is written generically (not tied to any specific institution's cluster)
so it can be followed on any SLURM-managed HPC system.

## 1. Connecting to a cluster

Most academic HPC clusters are reached one of two ways:

- **SSH** from a terminal: `ssh <username>@<cluster-hostname>`
- **A web portal** (many clusters run [Open OnDemand](https://openondemand.org/)),
  which gives you a browser-based shell, file browser, and job composer
  without needing a local SSH client.

Check with your own institution's research computing group for the correct
hostname/URL, connection requirements (VPN, campus network), and account
setup — these details are institution-specific and intentionally not
duplicated here.

## 2. Core Linux commands

| Command | Purpose |
|---|---|
| `pwd` | Print working directory |
| `ls`, `ls -la` | List directory contents |
| `cd <dir>` | Change directory |
| `mkdir <dir>` | Make a new directory |
| `cp <src> <dst>` | Copy a file |
| `mv <src> <dst>` | Move/rename a file |
| `rm <file>` | Remove a file |
| `wget <url>` | Download a file from the internet |
| `cat`, `less`, `head`, `tail` | View file contents |
| `grep <pattern> <file>` | Filter lines matching a pattern |
| `sed 's/old/new/' <file>` | Find-and-replace text |
| `awk '{print $1}' <file>` | Extract columns from delimited text |
| `command1 \| command2` | Pipe the output of one command into another |
| `command > file` | Redirect output to a new file |

## 3. Software modules

HPC clusters typically manage software with environment modules so multiple
versions of a tool can coexist:

```bash
module avail          # list available software
module load <name>    # load a specific tool into your environment
```

## 4. Submitting jobs with SLURM

Compute-intensive steps (alignment, quantification, etc.) should run as
scheduled batch jobs rather than interactively. A minimal SLURM batch
script looks like:

```bash
#!/bin/bash
#SBATCH -J my_job          # job name
#SBATCH -o my_job.out      # output log file
#SBATCH -N 1 -n 8          # 1 node, 8 tasks/cores

module load <tool>
<command to run>
```

Submit it with:

```bash
sbatch my_script.sh
```

Check your job's status with:

```bash
squeue -u $USER
```

See `scripts/bulk_rnaseq/` and `scripts/scrnaseq/` for complete, working
SLURM batch scripts used elsewhere in this course.
