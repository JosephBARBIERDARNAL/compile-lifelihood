<br>

Documentation of the process of compiling the Lifelihood project on macOS.

<br>

## Directory

- `compilation`: source and compiled files
- `data`: input data and custom settings
- `R`: R code that uses the compiled files
- `sanbox`: where to test things

<br><br><br>




## History

### April 25



<br>

### April 23

- Project seems to not be compiled correctly because executable files don't do much, so I re start from a clean base. 
   - put 7 source files in a directory
   - create a new project (Application) in Lazarus
   - add the 7 source files to the project
   - convert the Delphi project to a Lazarus project (see [this page](https://forum.lazarus.freepascal.org/index.php?topic=36933.0)). It seems that the project is now a Lazarus project (`.dpr` file disappeared and `.lpi` and `.lpr` file appeared (as well as others)).

- Try to compile the project. Multiple errors are raised:
   - `Error: .section __DATA, __datacoal_nt, coalesced`, but apparently those are just warnings that Lazarus flags as errors (see [this page](https://forum.lazarus.freepascal.org/index.php?topic=65422.0) and [this page](https://wiki.lazarus.freepascal.org/Mac_Installation_FAQ)).
   - `Error: linker: Undefined symbols for architecture x86_64:`
   - `Error: linker: "WSRegisterBevel", referenced from:`
   - `Error: ld: symbol(s) not found for architecture x86_64`
   - and finally: `Error: Error while linking`

- So I post a question on the Lazarus forum to see if someone can help me with this issue at [this adress](https://forum.lazarus.freepascal.org/index.php?topic=67059.msg515282#msg515282)
   - someone redirected me to [this page](https://forum.lazarus.freepascal.org/index.php/topic,64812.0.html) that is a discussion about the exact same issue (at least in terms of error messages).
   - the problem seems to be that Xcode command line tools above 15 on Sonoma breaks the compilation process.
   - one easy solution seemed to just downgrade Xcode to a version before 15 since the bug seems to be related to older version.

- I removed Xcode from my mac, went to Apple developer website to download the latest Xcode version before 15 (14.3.1). I installed it but unfortunately MacOS Sonoma (my version) requires a more recent Xcode version. So I reinstalled the last Xcode version (15.3) and I will try to find another solution.

- Since the problem seems related to the LLBD debugger, I tried to use GDB, but `brew install gdb` tells me that GDB does not work on M1 macs (which is also my case).

<br>

### April 15

- ✅ Successfully compiled a simple print hello world program using Lazarus. It was compiled with `fpc sanbox.pas` and executed with `./sandbox`. The output was `Hello, World!`. The code is as follows:
```pascal
program HelloWorld;
uses crt;

begin
   writeln('Hello, World!');
   readkey;
end. 
```

- ✅ Created a simple project in Lazarus and compiled a simple program that prints "Hello, World!" to the console. The code is as follows:
```pascal
program HelloWorld;
uses crt;

begin
   writeln('Hello, World!');
   readkey;
end. 
```
Once compiled, I ran the program with `./project1` and it worked as expected.

- ✅ Create a project in Lazarus and tried to compile the whole `Lifelihood` project. The project is not compiling because of the following error:
```
Unit1.pas(189,46) Error: Illegal assignment to for loop variable "j"
```
The error is in the following code:
```pascal
// Gerer les juveniles non sexés
for i:= 0 to nb_group - 1 do  for j := 0 to group[i].nb_ind - 1 do
 if group[i].gi[j].lh[0].events[0].tp=2 then roughgarden(i,j)  ;   
```
The `roughgarden` function is defined as follows:
```pascal
procedure roughgarden(var a,b:integer)      ;
var indvirtuel:ind_info; i:integer;
begin
with group[a].gi[b] do
  begin
  setlength(lh,2);
  nb_hv:=2;
  setlength(lh[1].events,lh[0].nb_event);
  lh[1].nb_event:=lh[0].nb_event;
  lh[0].events[0].tp:=0;
  for i:=0 to lh[1].nb_event-1 do lh[1].events[i]:=lh[0].events[i];
  lh[1].events[0].tp:=1;
  end;
end;
```
Not sure why this error is happening since the `j` variable is not being assigned to in the `roughgarden` function.

So I change `procedure roughgarden(var a,b:integer)` to `procedure roughgarden(a,b:integer)` in order to ensure that a and b are not passed by reference. This seems to solve the problem.

- ✅ Tried again to compile the project after the change and it seems to be working. The project is compiling without any errors.

- Tried to run the project with input data and see if it works.


<br>


### April 8

- 👎 Tried to use the [wine](https://www.winehq.org/) software for running `.exe` files directly on macOS, but does not seem to be solution to the problem. We rather need a compiler from source code directly.

- ✅ Followed tutorial from [this page](https://wiki.lazarus.freepascal.org/Installing_Lazarus_on_macOS) that explains how to install Lazarus on macOS (using [this page](https://sourceforge.net/projects/lazarus/)). Lazarus is a free cross-platform IDE which provides a Delphi-like development experience for Pascal. Main steps:
```
- Download and install Xcode (optional depending on your needs - see below for details).

- Install the global command line tools for Xcode. Definitely required.

- Download and install the Free Pascal Compiler (FPC) binaries package and the FPC source package from the Lazarus IDE file area (Important do this before you install the Lazarus IDE)

- Download and install the Lazarus IDE from the Lazarus IDE file area or, perhaps more useful, download and compile Lazarus source code, eg Lazarus Fixes 3.0

- Configure LLDB - the Apple supplied (and signed) debugger from within the Lazarus IDE.
```

- TODO next session: try to compile some code with Lazarus and see if it works.
