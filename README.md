# Basic Platform Reports <img src="https://github.com/mhjiang97/platform/blob/master/data-raw/platform.png" align="right" height="150" width="130/"/>

<font size="2"> we use Rmarkdown to render reports for research groups at SII </font>

## Author

Minghao Jiang, [jiangminghao1001@163.com](mailto:jiangminghao1001@163.com)

## Table of Contents

> -   [Dependencies](#dependencies)
> -   [Installation](#installation)
> -   [Usage](#usage)
> -   [License](#license)

------------------------------------------------------------------------

## Dependencies

1.  [x] Several R packages are required: `rmarkdown`, `glue`, `stringr`, `dplyr`, `vroom`, `DiagrammeR`, `openxlsx`, `tidyr`, `pander`, `showtext`, `sysfonts`, `knitr`  
2.  [x] You must install the font `Songti` into your system  
3.  [x] Version of `pandoc` >= **2.19.2**

## Installation

``` r
devtools::install_github("mhjiang97/platform")
```

## Usage

Too simple, so I didn't write a vignette for it.  
`library(platform)`, then check `report_bulk`, `report_sc`, and `report_tt` functions.

## License

**platform** is licensed under the [GNU General Public License v3](http://www.gnu.org/licenses/gpl-3.0.html)
