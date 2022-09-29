---
title: "单细胞转录组测序质控报告"
author: "上海交通大学医学院上海市免疫学研究所测序平台"
date: "2022-09-29"
output:
  rmarkdown::html_document:
    toc: true
    toc_float: true
    number_sections: true
    center: true
    theme: bootstrap
    highlight: zenburn
vignette: >
  %\VignetteIndexEntry{单细胞转录组测序质控报告}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
editor_options: 
  markdown: 
    wrap: 120
---

```{=html}
<style>
.vscroll-plot {
    width: 1000px;
    height: 400px;
    overflow-y: scroll;
}
.hscroll-plot {
    width: 500px;
    height: 200px;
    overflow-x: scroll;
}
</style>
```


------------------------------------------------------------------------------------------------------------------------

# 背景介绍

-   单细胞RNA测序（Single-cell RNA sequencing,
    scRNA-seq）是指在单个细胞的水平上对RNA进行高通量测序和分析的技术。在基因表达层面上，不同的细胞具有独特的转录组，即便是那些看似相同的细胞群，细胞之间的RNA
    表达水平上也不尽相同。由于受到检测的敏感度等技术限制，常规的RNA测序所使用的材料都是组织或一群细胞的混合物，即Bulk
    Sequencing。因而得到的结果只是大量细胞的平均数据，或者只是这群细胞的代表性信息，细胞之间的特异性信息往往被掩盖。
-   单细胞RNA测序技术能够获得样本中每个细胞的特异基因表达，已广泛应用于肿瘤异质性、免疫微环境、神经科学、胚胎发育、细胞分化等领域的研究。
-   目前测序平台单细胞RNA测序提供两种试剂盒：10X Genomics 3' V3.1及10X Genomics 5' V2，其中10X Genomics 5'
    V2同时可进行转录组及T、B细胞的VDJ测序。

------------------------------------------------------------------------------------------------------------------------

# 项目流程

-   单细胞转录组测序分析项目流程主要步骤包括单细胞悬液制备、细胞计数和细胞活率测定、10X
    Genomics上机及反转录、文库构建、上机测序和数据分析。


```
#> PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
#> Error in path.expand(path): invalid 'path' argument
```

## 单细胞悬液制备

-   由送样人员完成

## 细胞计数和细胞活率测定

-   平台接收单细胞悬液，轻柔吹打细胞悬液，取6μL细胞和6μL 2XDAPI染液轻柔混合均匀，取10μL迅速加入血球计数板人工计数。

-   备注（单细胞悬液质控要求）：

    -   细胞总数\>5万；

    -   活率\>80%，80%以下不建议上机；

    -   细胞重悬液：首选无钙镁、无EDTA的PBS+0.04%BSA；

    -   细胞浓度：600-1200个/ul （务必在所有离心步骤结束后计数，若计数后进行稀释或浓缩操作，务必再次计数）；

    -   细胞间无粘连（成团率\<5%）；

    -   无大于40um的细胞碎片或其他颗粒物；

    -   务必无红细胞。

## 10X Genomics上机及反转录

1.  将制备好的细胞悬液、10X barcode凝胶磁珠和油分别加入到Chromium Chip的不同小室，经由微流体"双十字"交叉系统形成GEM（Gel
    Beads-in-emulsion）；
2.  将GEM转入PCR仪进行反转录，GEM体系中含有游离poly(dT)的反转引物，反转录结束会加上CCC，凝胶磁珠上含有模板转换oligo（TSO）引物（含rGrGrG），最终使细胞中的RNA被反转录为带有Barcode和UMI信息的cDNA一链；
3.  磁珠纯化一链cDNA；
4.  纯化后的cDNA进行PCR扩增；
5.  cDNA使用Qubit检测浓度，质检，检测片段大小。cDNA曲线会因组织类型和质量的差异而不同；存在低分子量产物(35-150bp)是正常的，并不影响后续建库实验。

## 测序文库构建

1.  cDNA扩增完成后，酶切片段化并磁珠筛选最适片段，通过末端修复、加A、接头连接Read2测序引物，再以PCR方式构建含有P5和P7接头的cDNA文库。
2.  文库用磁珠进行纯化；
3.  文库使用 Qubit检测浓度，质检，检测片段大小。一般文库分布于在300-800bp，平均片段分布于400-500bp。
4.  若需要检测VDJ，则从扩增后cDNA中，通过T cell 和B cell特殊引物富集出TCR和BCR产物;
5.  富集后的产物，酶切片段化并磁珠筛选最适片段，通过末端修复、加A、接头连接Read2测序引物，再以PCR方式构建含有P5和P7接头的cDNA文库。
6.  文库用磁珠进行纯化；
7.  文库使用 Qubit检测浓度，质检，检测片段大小。一般文库分布于在300-800bp，平均片段分布于400-600bp。

## 上机测序

-   文库质检合格后，利用二代测序仪Novaseq6000平台对文库进行测序，测序策略为PE150。

------------------------------------------------------------------------------------------------------------------------

# 各样本质控信息

## 测序数据比对质控

[表格下载](tables/summary.xlsx)

网页信息详见[下文](#cell-ranger-web-summary)

::: vscroll-plot

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Sample_ID     Estimated Number of Cells   Mean Reads per Cell   Median Genes per Cell   Number of Reads   Valid Barcodes   Sequencing Saturation   Q30 Bases in Barcode   Q30 Bases in RNA Read   Q30 Bases in RNA Read 2   Q30 Bases in UMI   Reads Mapped to Genome   Reads Mapped Confidently to Genome   Reads Mapped Confidently to Intergenic Regions   Reads Mapped Confidently to Intronic Regions   Reads Mapped Confidently to Exonic Regions   Reads Mapped Confidently to Transcriptome   Reads Mapped Antisense to Gene   Fraction Reads in Cells   Total Genes Detected   Median UMI Counts per Cell 
-------------- --------------------------- --------------------- ----------------------- ----------------- ---------------- ----------------------- ---------------------- ----------------------- ------------------------- ------------------ ------------------------ ------------------------------------ ------------------------------------------------ ---------------------------------------------- -------------------------------------------- ------------------------------------------- -------------------------------- ------------------------- ---------------------- ----------------------------
 TF2208SBZM3X             21030                    32732                  1069               688358383          0.918                0.775                  0.963                   0.906                    0.913                 0.958                 0.931                          0.842                                      0.042                                           0.075                                         0.725                                        0.641                                 0.052                         0.909                   23713                      1795            

    Check         ***Risk of Doublet***            Pass                     -                    -               Pass                Pass                     -                     Pass                       -                     -                     -                              -                                          -                                               -                                             -                                          Pass                                   Pass                         Pass                      -                         -              

 TX2208SBQJ2              11861                    36557                   682               433604441          0.979                0.781                  0.964                   0.912                      -                   0.955                 0.968                          0.936                                      0.113                                           0.076                                         0.747                                        0.699                                 0.011                         0.654                   23627                      1597            

    Check                 Pass                     Pass                     -                    -               Pass                Pass                     -                     Pass                       -                     -                     -                              -                                          -                                               -                                             -                                          Pass                                   Pass                   ***Acceptable***                -                         -              

 TX2208SBQJ3              17516                    26227                   771               459397090          0.978                0.603                  0.963                   0.914                      -                   0.952                 0.964                           0.94                                      0.093                                           0.119                                         0.727                                        0.679                                 0.012                         0.72                    24029                      1948            

    Check         ***Risk of Doublet***            Pass                     -                    -               Pass                Pass                     -                     Pass                       -                     -                     -                              -                                          -                                               -                                             -                                          Pass                                   Pass                         Pass                      -                         -              

 TX2208SBQJ4              9225                     44797                   949               413253855          0.975                0.721                  0.963                   0.908                      -                   0.954                 0.964                           0.93                                      0.094                                           0.139                                         0.697                                        0.651                                 0.016                         0.741                   23462                      2476            

    Check                 Pass                     Pass                     -                    -               Pass                Pass                     -                     Pass                       -                     -                     -                              -                                          -                                               -                                             -                                          Pass                                   Pass                         Pass                      -                         -              
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:::

## cDNA质控

[图片下载](qc_cdna)

::: vscroll-plot

```
#> Error in knitr::include_graphics(path = qc_cdna): Cannot find the file(s): "../../../platform/doc/QC/TF2208SBZM3X-cDNA_Labchip_2022-09-07_14-33-40_Electropherogram_G12.bmp"; "../../../platform/doc/QC/TX2208SBQJ2X-cDNA_Labchip_2022-09-07_14-33-40_Electropherogram_H21.bmp"; "../../../platform/doc/QC/TX2208SBQJ3X-cDNA_Labchip_2022-09-07_14-33-40_Electropherogram_H22.bmp"; "../../../platform/doc/QC/TX2208SBQJ4X-cDNA_Labchip_2022-09-07_14-33-40_Electropherogram_I4.bmp"
```
:::

## 文库质控

[图片下载](qc_library)

::: vscroll-plot

```
#> Error in knitr::include_graphics(path = qc_library): Cannot find the file(s): "../../../platform/doc/QC/2100 expert_DNA 1000_DE13806856_2022-08-18_15-17-28_EGRAM_TF2208SBZM3X.bmp"; "../../../platform/doc/QC/2100 expert_DNA 7500_DE13806856_2022-09-06_12-31-37_EGRAM_TX2208SBQJ2X.bmp"; "../../../platform/doc/QC/2100 expert_DNA 7500_DE13806856_2022-09-06_12-31-37_EGRAM_TX2208SBQJ3X.bmp"; "../../../platform/doc/QC/2100 expert_DNA 7500_DE13806856_2022-09-06_13-06-59_EGRAM_TX2208SBQJ4X.bmp"
```
:::

------------------------------------------------------------------------------------------------------------------------

# Cell Ranger Web Summary {#cell-ranger-web-summary}

* **TF2208SBZM3X**样本，详见[链接](summaries/web_summary_TF2208SBZM3X.html)



<iframe height="800" width="100%" src="
      summaries/web_summary_TF2208SBZM3X.html" frameborder="0" allowfullscreen>
</iframe>



* **TX2208SBQJ2**样本，详见[链接](summaries/web_summary_TX2208SBQJ2.html)



<iframe height="800" width="100%" src="
      summaries/web_summary_TX2208SBQJ2.html" frameborder="0" allowfullscreen>
</iframe>



* **TX2208SBQJ3**样本，详见[链接](summaries/web_summary_TX2208SBQJ3.html)



<iframe height="800" width="100%" src="
      summaries/web_summary_TX2208SBQJ3.html" frameborder="0" allowfullscreen>
</iframe>



* **TX2208SBQJ4**样本，详见[链接](summaries/web_summary_TX2208SBQJ4.html)



<iframe height="800" width="100%" src="
      summaries/web_summary_TX2208SBQJ4.html" frameborder="0" allowfullscreen>
</iframe>

------------------------------------------------------------------------------------------------------------------------

# Cell Ranger Web Summary解读

## 异常结果警告

-   如果数据中存在异常，在网页的头部会出现黄色警告框。
-   点击`Details`, 可以看到相应的详细的信息。

## 细胞和基因数目评估

-   对样本中的细胞和表达的基因个数评估。同时还给出了**barcode**, **index**, **UMI**, **RNA reads**不同序列的**Q30**。

-   其中：

    -   Estimated number of cells - 样本测到的细胞数，应大于3000，但大于15000时可能存在doublet
    -   Mean reads per cell - 每个细胞测到的平均reads，应大于2000
    -   Median genes per cell - 每个细胞基因数的中位数
    -   Sequencing中：
        -   Number of reads - 测到的总read数目
        -   Valid barcodes - UMI校正后匹配的UMI数量，应高于75%
        -   Sequencing saturation -
            测序饱和度，一般**60-80%**比较合适，高于**70%-80%**左右为最佳。如果测到的细胞数多，但是每个细胞里面的平均reads数少，那么饱和度降低。反之饱和度升高。但也不是越高越好，到达80%左右即可以代表整个样本
        -   Q30 bases in barcode - 基于barcode的分数，质量大于30的比率
        -   Q30 bases in RNA read - 基于RNA read的分数，质量大于30的比率
        -   Q30 bases in UMI - 基于UMI的分数，质量大于30的比率
        -   Q30一般要大于**65%**，少于此比例的话则报错（页面上方有黄色的warning提示）。

## 比对比例统计

-   统计reads的比对比例，同时给出比对到基因间区，外显子，内含子的比例。
-   这一项是对cellranger count程序中--transcriptome=refdata-cellranger 的反馈报告，比对的是人类基因组或小鼠基因组。
-   其中：
    -   Reads mapped to genome - 比对到选定基因组的reads
    -   Reands mapped confidently to genome -
        仅比对到基因组的reads。如果一条reads既可以比对到外显子区又可以比对到非外显子区，那么算比对到外显子区
    -   Reads mapped confidently to intergenic regions - 比对到基因组的基因间区域
    -   Reads mapped confidently to intronic regions - 比对到内含子区域
    -   Reads mapped confidently to exonic regions - 比对到外显子区域
    -   Reads mapped confidently to transcriptome - 比对到转录组的reads，这些读数可以用来UMI的计数，应高于30%
    -   Reads mapped antisense to gene - 比对到基因的相反的reads，应低于10%

## 细胞数目评估详细信息

-   比较重要是曲线图。图中横轴是barcodes，纵轴是UMI数量，绿色线条代表真实的检测到的真实细胞数。

-   通过barcode上的UMI标签分布来评估细胞数目，深蓝色代表细胞，灰色代表背景。

-   在前期磁珠（bead）与细胞形成油包水的结构过程中，会存在没有把细胞包进去的情况，这时候的油包水结构里面就只有磁珠和一些barcode的序列，而cDNA的碱基序列一般都是barcode碱基序列的10倍以上，就是由此来确定哪些是真实的细胞，哪些是background。

-   其中：

    -   Estimated number of cells - 样本测到的细胞数
    -   Fraction reads in cells - valid-UMI的质量分数，代表与细胞相关的UMI可靠地比对到基因组，一般要在**60%**以上
    -   Mean reads per cell - 每个细胞测到的平均reads
    -   Median genes per cell - 每个细胞的中间基因数
    -   Total genes detected - 测到的总基因数，至少有一条UMI
    -   Median UMI counts per cell - 细胞UMI数量的中间值

## 样本基本信息

-   样本名称，使用的参考基因组等信息。

------------------------------------------------------------------------------------------------------------------------
