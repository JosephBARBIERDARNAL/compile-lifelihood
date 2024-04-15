program GreetUser;
uses crt;

var
  userName: string;

begin
  writeln('Please enter your name:');
  readln(userName);
  writeln('Hello, ', userName, '!');
  readkey;
end.
