
# Replication Package for “Productive demand, sectoral comovement, and total capacity utilization”

For a detailed PDF overview, see the [Replication Package](Replication_Package.pdf).

**Authors:** Mario Rafael Silva, Marshall Urias

## Table of Contents

- [Introduction](#introduction)  
- [Details of raw data and variable construction](#details-of-raw-data-and-variable-construction)  
  - [Raw data](#raw-data)  
  - [Variable construction](#variable-construction)  
- [System Requirements](#system-requirements)  
  - [Software and Packages](#software-and-packages)  
  - [Hardware](#hardware)  
- [Folder structure](#folder-structure)  
- [Details of replication](#details-of-replication)  
  - [Data construction and descriptive statistics](#data-construction-and-descriptive-statistics)  
  - [Estimation](#estimation)  

---

## Introduction

This package contains the code and data to replicate the results. Please note that Figures 2-4 relate only to the model structure, not data. Moreover, Table C.7 is just a set of prior distributions for a special case of the model.

---

## Details of raw data and variable construction

### Raw data

We list the data sources used in both description and estimation, grouped by source.

1. **U.S. Bureau of Economic Analysis**
   - Personal Consumption Expenditures: Nondurable Goods (PCND). Billions of Dollars, Seasonally Adjusted Annual Rate. Quarterly.
   - Personal Consumption Expenditures: Services (PCESV). Billions of Dollars, Seasonally Adjusted Annual Rate. Quarterly.
   - Personal Consumption Expenditures: Durable Goods (PCDG). Billions of Dollars, Seasonally Adjusted Annual Rate. Quarterly.
   - Private Nonresidential Fixed Investment (PNFI). Billions of Dollars, Seasonally Adjusted Annual Rate. Quarterly.
   - Personal Consumption Expenditures: Chain-type Price Index (PCEPI). Index 2017=100, Seasonally Adjusted. Monthly.
   - Gross Domestic Product: Implicit Price Deflator (GDPDEF). Index 2017=100, Seasonally Adjusted. Quarterly.

2. **U.S. Bureau of Labor Statistics**
   - Population Level (CNP16OV). Thousands of Persons, Not Seasonally Adjusted. Monthly.
   - Table B-6. Employment of production and nonsupervisory employees on private nonfarm payrolls by industry sector, seasonally adjusted. Extract Construction, Durable goods, Nondurable goods, Private service-providing.
   - Table B-7. Average weekly hours and overtime of production and nonsupervisory employees on private nonfarm payrolls by industry sector, seasonally adjusted. Extract Construction, Durable goods, Nondurable goods, Private service-providing.

3. Investment Deflator (INVDEF). Index 2012=100, Seasonally Adjusted. Quarterly. Source: DiCecio, Ricardo.

4. Board of Governors of the Federal Reserve System
   - Capacity Utilization: Total Index (TCU). Percent, Seasonally Adjusted. Monthly.
   - Capacity Utilization: Durable Manufacturing (NAICS) (CAPUTLGMFDS). Percent, Seasonally Adjusted. Monthly.
   - Capacity Utilization: Nondurable Manufacturing (NAICS) (CAPUTLGMFNS). Percent, Seasonally Adjusted. Monthly.

5. Utilization data from [Fernald (2014)]<a href="https://doi.org/10.24148/wp2012-19." class="underline" target="_blank">https://doi.org/10.24148/wp2012-19.</a> Federal Reserve Bank of San Francisco Working Paper 2012-19.

---

### Variable construction

Appendix B in the main text details the construction of variables used in the paper given the raw data. For convenience, we summarize it below:

| Symbol        | Description                                   | Construction                                  |
|---------------|-----------------------------------------------|----------------------------------------------|
| \(C\)         | Nominal consumption                           | PCND + PCESV                                 |
| \(I\)         | Nominal gross private domestic investment    | PCDG + PNFI + PRFI                           |
| Deflator      | GDP Deflator                                  | GDPDEF                                       |
| Pop           | Civilian non-institutional population        | CNP160V                                      |
| \(P_c\)       | Price index: consumption                      | PCEPI                                        |
| \(P_i\)       | Price index: investment                       | INVDEV                                       |
| c             | Real per capita consumption                   | \(\frac{C}{Pop \times P_c}\)                 |
| i             | Real per capita investment                    | \(\frac{I}{Pop \times P_i}\)                 |
| y             | Real per capita output                        | \(c + i\)                                    |
| \(n_c\)       | Labor in consumption sector                   | Labor in nondurables and services            |
| \(n_i\)       | Labor in investment sector                    | Labor in construction and durables           |
| \(n\)         | Aggregate labor                              | \(n_c + n_i\)                                |
| \(p_i\)       | Relative price of investment                   | \(\frac{P_i}{P_c}\)                          |
| \(util_{ND}\) | Total capacity utilization: nondurables      | TCU                                          |
| \(util_D\)    | Total capacity utilization: durables          | TCU                                          |
| SR            | Solow residual                               | Fernald (2014), FRB of San Francisco         |
| SR\(_{util}\) | Utilization-adjusted Solow residual            | Fernald (2014), FRB of San Francisco         |

*Table 1: Data sources used in motivating evidence and estimation.*

---

The construction of sectoral data follows Katayama et al. (2018). We obtain consumption and investment as follows:

\[
\begin{align}
C_t &= \left(\frac{\text{Nondurable (PCND)} + \text{Services (PCESV)}}{P_c \times \text{Civilian Noninstitutional Population (CNP160V)}}\right) \\
I_t &= \left(\frac{\text{Durable (PCDG)} + \text{Nonresidential Investment (PNFI)} + \text{Residential Investment (PRFI)}}{P_i \times \text{Civilian Noninstitutional Population (CNP160V)}}\right)
\end{align}
\]

We use an HP-filtered trend for population \((\lambda = 10,000)\) to eliminate jumps around census dates.

For labor data, we make use of BLS Table B-6, which contains the number of production and non-supervisory employees by industry; and BLS Table B-7, which contains average weekly hours of each sector. We compute total hours for nondurables, services, construction, and durables by multiplying the relevant components of each table. Then we impute labor in consumption as the sum of labor in nondurables and services. Similarly, we construct labor in investment as the sum of labor in construction and durables.

---

## System Requirements

### Software and Packages

- **MATLAB** R2023a or later, with Dynare 6.3
- **Python** 3.9 with packages: `numpy`, `pandas`, `scipy`, `matplotlib`, etc.
- **Julia** 1.10 with packages: `Parameters`, `PlotlyJS`, `MAT`, `DataFrames`, `Distributions`, etc.

### Hardware

Results were generated on a Dell Optiplex 7080, Windows 10 Enterprise, Intel Core i7, 32GB RAM.

---

## Folder structure

The master folder contains a subfolder `Programs`, which in turn contains a subfolder `Estimation`.

- **Programs:** Contains two files
  - `observables.py`: Constructs data used for description and estimation. It generates the observables used for estimation in `observables_sectoral.mat`. This superset includes the set of observables used in the baseline model as well as the aggregate data used for the BRS proof of concept exercises. It also generates Table 1, Figure 1, Figure A.9, and Figure B.10.
  - `time_series_functions.py`: This program contains a suite of functions related to filtering time series and calculating moments. In particular, we use the functions `moments`, `hamilton_filter`, `growth`, and `filter_transform`.

- **Estimation:** Includes the main estimation program `dynare_main.m` that runs results from multiple Dynare `.mod` files. The `.mod` files use the prefix `SU`, abbreviation of Silva and Urias or “Sectoral Utilization”.
  - `dynare_main.m`
  - `main_table.m`: generates output for Table 5
  - `FEVD_table.m`: calculates FEVD for grouped shocks (Table 4)
  - `decompose_demand.m`: disaggregates demand FEVD into specific demand shocks (Online Appendix Table 4)
  - `decompose_technology.m`: disaggregates technology FEVD into specific technology shocks (Online Appendix Table 5)
  - `SU_sectoral.mod`: benchmark estimation
  - `SU_sectoral_perfect_mobility.mod`: allows perfect flexibility in labor supply
  - `SU_sectoral_com_wage_markup.mod`: uses a single wage-markup shock instead of varying across sectors
  - `SU_sectoral_wo_fixed_cost.mod`: removes fixed costs
  - `SU_sectoral_wo_vcu.mod`: removes variable capital intensity (capital stock always used at rate unity)
  - `SU_sectoral_wo_demand_shocks.mod`: removes search demand shocks
  - `SU_sectoral_wo_dem_shocks_res.mod`: removes search demand shocks and utilization variables from observables
  - `SU_sectoral_artificial_data.mod`: estimates model on artificial data generated from model with parameters set to posterior mean
  - `SU_growth_id.mod`: estimation of BRS model, including estimation of parameters \(\phi\) and \(\eta\). Uses observables \(I, Y, Y/N, p_i\).
  - `SU_util.mod`: same model as `SU_growth_id.mod` but extended to include total capacity utilization.

For each of these files, there is a Dynare generated `.log` file recording the estimation results. Moreover, there is an associated folder with the same name generated by Dynare bearing the following subfolders: `graphs`, `latex`, `metropolis`, `modecheck`, `model`, `Output`, `prior`.

### Organization of `.mod` files:

- Variable definitions with descriptions
- Exogenous processes
- List of parameters
- Specification of parameter values
- `model` block:
  - Dependent parameters specified via `#`
  - Main model equations
  - Observation equations linking model analogues to data
- `steady_state_model` block: calculates calibrated steady state sequentially (no external MATLAB file or numeric solver needed)
- `shocks` block
- `steady` and `check` blocks
- `estimated_params` block: specifies initial values and prior distributions
- `estimation` block, with key features in the baseline:
  - `datafile=observables_sectoral`: specifies data file containing observed series used for estimation
  - `load_mh_file`: instructs Dynare to load previous MCMC draws from disk
  - `mcmc_jumping_variance=hessian`: sets initial covariance matrix for MCMC proposal distribution to inverse Hessian at mode (some alternate models use `prior_variance` instead)
  - `mode_compute=0`: Dynare does not compute the mode but uploads it
  - `mh_replic=0`: specifies number of posterior draws; `0` means just process existing draws
  - `mh_nblocks=2`: runs two chains in parallel for MCMC
  - `mh_drop=0.3`: fraction of initial MCMC draws discarded as burn-in

---

### Julia files in the folder:

- `calibration_cs.jl`: calibrates the model given targets and generates Table 2 (Calibration). Uses posterior mean from baseline model because various parameters depend on estimated values.
- `bayesian_analysis.jl`: generates impulse responses at posterior mean (Figures 6-8) alongside Figure 5 (posterior and prior distributions).

---

## Details of replication

### Data construction and descriptive statistics

- All data, including disaggregated capacity utilization series, can be fetched from the Federal Reserve Economic Database except for the sectoral labor hours. These are accessible from Tables B6 and B7 from the Bureau of Labor Statistics and are available in the file `sectoral_labor.csv`.
- Run `observables.py`. This generates a superset of the data used for estimation `observables_sectoral.mat` if one sets `save_observables = True`. Note that the baseline model uses `C_obs, I_obs, NC_obs, NI_obs, p_I_obs, util_D_obs, util_ND_obs`. The variables `Y_obs, Y_N_obs` are not used for the main sectoral analysis but instead for the BRS exercises.
  - Current specification: `stoch_simul(order=1, nofunctions, irf=20, periods=0)` generates unconditional moments.
  - Switching `periods=223` generates artificial data of length 223 for the identification analysis. The artificial data is saved as `artificial_data.mat`.
- This file also generates Table 1 (second moments), Figure 1, Table 4 (FEVD), Figure B.10, Figure A.9, and Online Appendix Tables 4 and 5.

---

### Estimation

- Run `dynare_main.m` in batches to sequentially generate all the model results:
  1. Part 1: estimate main model `SU_sectoral.mod`, save output, generate artificial data. Outputs used for Tables 3, 4, and baseline column of Table 5.
  2. Part 2: estimate `SU_sectoral_perfect_mobility.mod`. Output used for column “Perfect labor mobility” in Table 5.
  3. Part 3: estimate `SU_sectoral_com_wage_markup.mod`. Output used for column “Common wage markup” in Table 5.
  4. Part 4: estimate `SU_sectoral_wo_fixed_cost.mod`. Output used for column “Remove fixed cost” in Table 5.
  5. Part 5: estimate `SU_sectoral_wo_vcu.mod`. Output used for column “Remove VCU” in Table 5.
  6. Part 6: estimate `SU_sectoral_wo_demand_shocks.mod`. Output used for column “Remove SDS” in Table 5.
  7. Part 7: estimate `SU_sectoral_wo_dem_shocks_res.mod`. Output used for column “Remove SDS and utilization data” in Table 5.
  8. Part 8: estimate `SU_sectoral_artificial_data.mod`. Output used for Table 3 in the Supplemental Online Appendix.
  9. Part 9: estimate `SU_growth_id.mod` and `SU_util.mod`, corresponding to BRS model specifications without and with utilization data. Outputs used for Tables C.8 and C.9 of the Supplemental Online Appendix.

- For calibration, run `calibration_cs.jl` (generates Table 2).
- For posterior-prior plots (Figure 5) and impulse responses (Figures 6-8), run `bayesian_analysis.jl`.



