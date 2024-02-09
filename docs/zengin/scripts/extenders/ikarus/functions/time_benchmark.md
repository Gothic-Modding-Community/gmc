# Time and Benchmark
Set of functions to time measurement and Benchmark.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L4596-L4714)

## Time functions

### `MEM_GetSystemTime`
Returns the elapsed time since Gothic started.
```dae
func int MEM_GetSystemTime()
```
**Return value**

The function returns the elapsed time since the start of Gothic in milliseconds. This value is used for timing measurements, in the `BenchmarkMS` functions.

### `MEM_GetPerformanceCounter`
Call to the WinAPI [`QueryPerformanceCounter`](https://learn.microsoft.com/en-us/windows/win32/api/profileapi/nf-profileapi-queryperformancecounter) function.
```dae
func int MEM_GetPerformanceCounter()
```
**Return value**

The function returns a value representing the number of elapsed ticks since the system was started. This value is used for timing measurements, in the `BenchmarkPC` functions.

## Benchmark functions

!!! Tip
    For reliable results, avoid measuring a single run of a function; instead, measure the total duration of multiple runs (e.g., 1000). This is crucial, especially for very fast functions, as a single run can distort the measurement. Use `_N` benchmark functions to include a parameter specifying the number of runs for function `f`.

    Choose the parameter `n` to ensure meaningful results. If `n` executions take less than a millisecond, obtaining a return value in milliseconds has no sense. For very fast functions, the time spent in the benchmark function, not in `f`, significantly affects the measurement, falsifying the result. Reliable measurements are achievable only for functions with sufficient slowness.

    For reference, here is a timing for some operations (in nanoseconds, i.e., billionths of a second):
    ```
    - Function call (jumping back and forth): 30ns
    - Elementary calculation (e.g., i = i + 1): 130ns
    - Wld_IsTime: 200ns
    - MEM_ReadInt, MEM_WriteInt: 350ns
    - Hlp_StrCmp("Hello", "Hello"): 500ns
    - MEM_InstToPtr: 1400ns
    - (small) Allocate and free memory: 9700ns
    - CALL__stdcall (in empty function): 29000ns
    - MEM_GetParserSymb: 280000ns

    - Iteration of the benchmark function: 300ns
    ```

### `MEM_BenchmarkMS`
Benchmark of the execution time for a specified function. (Milliseconds)
```dae
func int MEM_BenchmarkMS(var func f)
```
**Parameters**

- `#!dae var func f`  
    Function to benchmark

**Return value**

The function returns the duration of a function execution in milliseconds.

### `MEM_BenchmarkMMS`
Benchmark of the execution time for a specified function. (microseconds)
```dae
func int MEM_BenchmarkMMS(var func f)
```
**Parameters**

- `#!dae var func f`  
    Function to benchmark

**Return value**

The function returns the duration of a function execution in microseconds.

### `MEM_BenchmarkPC`
Benchmark of the execution time for a specified function, using the [Performancecounter](#mem_getperformancecounter).
```dae
func int MEM_BenchmarkMS(var func f)
```
**Parameters**

- `#!dae var func f`  
    Function to benchmark

**Return value**

The function returns the number of [Performancecounter](#mem_getperformancecounter) ticks the function needs.

### `MEM_BenchmarkMS_N`
[`MEM_BenchmarkMS`](#mem_benchmarkms), but with the parameter to specify the number of function runs.
```dae
func int MEM_BenchmarkMS_N(var func f, var int n)
```
**Parameters**

- `#!dae var func f`  
    Function to benchmark
- `#!dae var int n`  
    Number of runs

**Return value**

The function returns a summed duration of multiple (`n`) runs of the function in milliseconds.

### `MEM_BenchmarkMMS_N`
[`MEM_BenchmarkMMS`](#mem_benchmarkmms), but with the parameter to specify the number of function runs.
```dae
func int MEM_BenchmarkMMS_N(var func f, var int n)
```
**Parameters**

- `#!dae var func f`  
    Function to benchmark
- `#!dae var int n`  
    Number of runs

**Return value**

The function returns a summed duration of multiple (`n`) runs of the function in microseconds.

### `MEM_BenchmarkPC_N`
[`MEM_BenchmarkPC`](#mem_benchmarkpc), but with the parameter to specify the number of function runs.
```dae
func int MEM_BenchmarkPC_N(var func f, var int n)
```
**Parameters**

- `#!dae var func f`  
    Function to benchmark
- `#!dae var int n`  
    Number of runs

**Return value**

The function returns a summed number of [Performancecounter](#mem_getperformancecounter) ticks needed to execute function multiple (`n`) times.