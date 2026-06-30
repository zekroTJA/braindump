[[AWS]] EC2 instance names follow a fairly consistent pattern:

**General format:**

```
<instance family><generation><options>.<size>
```

For example:

```
m7g.large
```

Breaks down as:

|Part|Meaning|Example|
|---|---|---|
|**Family**|What the instance is optimized for|`m`, `c`, `r`, `t`, `p`, `g`|
|**Generation**|Hardware generation|`5`, `6`, `7`, `8`|
|**Options**|CPU architecture or special features|`g`, `a`, `i`, `n`, `d`, etc.|
|**Size**|Number of vCPUs/memory|`large`, `xlarge`, `2xlarge`, etc.|

### 1. Instance family

This tells you the primary purpose.

|Family|Purpose|
|---|---|
|`t`|Burstable general purpose|
|`m`|General purpose|
|`c`|Compute optimized|
|`r`|Memory optimized|
|`x`|Extra memory|
|`i`|Storage optimized (IOPS)|
|`d`|Dense storage|
|`h`|HDD storage|
|`g`|GPU graphics|
|`p`|GPU compute|
|`trn`|AI training|
|`inf`|AI inference|

Examples:

- `t4g`
- `m7i`
- `c8g`
- `r7a`

---

### 2. Generation number

Usually newer is better.

Examples:

- `m5`
- `m6`
- `m7`
- `c8`

Higher numbers generally mean newer CPUs and improved performance.

---

### 3. Option letters

These indicate CPU type or special hardware.

Common ones:

|Letter|Meaning|
|---|---|
|`g`|AWS Graviton (ARM) CPU|
|`i`|Intel Xeon|
|`a`|AMD EPYC|
|`n`|Higher network bandwidth|
|`d`|Local NVMe SSD storage|
|`e`|Extra memory|
|`z`|High-frequency CPU|
|`b`|Block storage optimized|
|`flex`|Flexible vCPU/memory configuration (appears as a suffix, e.g. `m7i-flex`)|

Examples:

- `m7g` → Graviton
- `m7i` → Intel
- `m7a` → AMD
- `c7gn` → Graviton + enhanced networking
- `r7gd` → Graviton + local SSD

Options can be combined.

Example:

```
c7gd
│││└─ local SSD
││└── Graviton
│└─── generation 7
└──── compute optimized
```

---

### 4. Size

The size determines CPU, RAM, and networking capacity.

Typical progression:

```
nano
micro
small
medium
large
xlarge
2xlarge
4xlarge
8xlarge
12xlarge
16xlarge
24xlarge
32xlarge
48xlarge
metal
```

Each step generally doubles CPU and memory from the previous size.

Examples:

- `t3.micro`
- `m7i.large`
- `c8g.2xlarge`
- `r7a.16xlarge`

---

## Putting it all together

|Instance|Meaning|
|---|---|
|`t4g.micro`|Burstable, generation 4, Graviton, micro size|
|`m7i.large`|General purpose, generation 7, Intel, large|
|`m7a.xlarge`|General purpose, generation 7, AMD, xlarge|
|`c8g.4xlarge`|Compute optimized, generation 8, Graviton, 4xlarge|
|`r7gd.2xlarge`|Memory optimized, generation 7, Graviton, local NVMe SSD|
|`i4i.large`|Storage optimized, generation 4, Intel|
|`p5.48xlarge`|GPU compute, generation 5, 48xlarge|

### A quick mental decoder

When you see an EC2 instance name:

```
m7gd.2xlarge
```

Read it left to right:

- **m** → General purpose
- **7** → 7th generation
- **g** → Graviton (ARM)
- **d** → Local NVMe SSD
- **2xlarge** → The chosen capacity

Once you know the families (`t`, `m`, `c`, `r`, `i`, `g`, `p`) and the common option letters (`g`, `i`, `a`, `d`, `n`), you can infer most of an instance's characteristics just from its name.