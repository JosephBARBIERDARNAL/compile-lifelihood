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

<br>

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

<br>

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

<br>

- 👎 Tried to use the [wine](https://www.winehq.org/) software for running `.exe` files directly on macOS, but does not seem to be solution to the problem. We rather need a compiler from source code directly.

<br>

- ✅ Followed tutorial from [this page](https://wiki.lazarus.freepascal.org/Installing_Lazarus_on_macOS) that explains how to install Lazarus on macOS (using [this page](https://sourceforge.net/projects/lazarus/)). Lazarus is a free cross-platform IDE which provides a Delphi-like development experience for Pascal. Main steps:
```
- Download and install Xcode (optional depending on your needs - see below for details).

- Install the global command line tools for Xcode. Definitely required.

- Download and install the Free Pascal Compiler (FPC) binaries package and the FPC source package from the Lazarus IDE file area (Important do this before you install the Lazarus IDE)

- Download and install the Lazarus IDE from the Lazarus IDE file area or, perhaps more useful, download and compile Lazarus source code, eg Lazarus Fixes 3.0

- Configure LLDB - the Apple supplied (and signed) debugger from within the Lazarus IDE.
```

<br>

- TODO next session: try to compile some code with Lazarus and see if it works.
