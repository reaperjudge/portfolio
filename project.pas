{$mode objfpc} // directive to be used for defining classes
{$m+}	       // directive to be used for using constructor
program Classproject;
Uses
   sysutils, classes;  //import some classes

type
   userinput = string; //create a type for userinput
   Sign = class        //create a class holder

   private
     month : string;   //create month string in sign class
     day : integer;    //create a day integer in sign class

   public
      constructor create(m , d : string);  //state that a constructor exists
      procedure printout;                  //printout procedure exists
      procedure printstr;                  //printstr procedure exists
      function createstr(sign:string):string ;   //createstr will output string

end;
var
   m1: Sign;                               //create a instance of class
   month : userinput;                      //create a userinput named month
   day : userinput;                        //create a userinput named day
   list: TStringList;                      //create a TStringList named list

constructor Sign.create(m, d : string);
{construct a sign instance}
begin
  month := Lowercase(trim(m)); //trim whitespace off month and lowercase
  Try
     day := StrToInt(trim(d));   //try to trim and convert day to int
   except
   On E : EConvertError do
     {for a non-integer input}
     Writeln('That is not real day');
     end;
end;

function Sign.createstr(sign : string): string;
begin
  list := TStringList.create;           //create empty list
  try
    list.LoadFromFile(sign +'.txt');    //load file
    Randomize;                          //randomize line read
    createstr :=  list[Random(list.Count)];//return a line
  finally
    list.Free;//destroy the list
  end;
end;

procedure Sign.printstr;
begin
    writeln('Horoscope: ' + self.createstr('Horoscopes')); //print a line from file
    writeln('           *************************************      ');
end;

procedure Sign.printout;
begin
   if  (day = 0) then
   begin
        writeln;
   end

   else if day > 31 then
   begin
        writeln('too large of number!');
   end

   else if ((month = 'january') AND (day >= 20)) OR ((month = 'february') AND (day <= 18)) then
   begin
        self.printstr;
        writeln('You are a Aquarius! Aquarius is the most humanitarian astrological sign.');
   end

   else if ((month = 'february') AND (day >= 19)) OR ((month = 'march') AND (day <= 20)) then
   begin
        self.printstr;
        writeln('You are a Pisces! Pisces has absorbed every lesson - the joys and the pain, the hopes and the fears.');
   end

   else if ((month = 'march') AND (day >= 21)) OR ((month = 'april') AND (day <= 19)) then
   begin
        self.printstr;
        writeln('You are an Aries! Bold and ambitious, an Aries dives headfirst into even the most challenging situations.');
   end

   else if ((month = 'april') AND (day >= 20)) OR ((month = 'may') AND (day <= 20)) then
   begin
        self.printstr;
        writeln('You are a Tarus! Like their celestial spirit animal, Taureans enjoy relaxing in serene,'+
        'bucolic environments surrounded by soft sounds, soothing aromas, and succulent flavors.');
   end

   else if ((month = 'may') AND (day >= 21)) OR ((month = 'june') AND (day <= 20)) then
   begin
        self.printstr;
        writeln('You are a Gemini! Appropriately symbolized by the celestial twins, Gemini are interested in so many pursuits that it had to double itself.');
   end

   else if ((month = 'june') AND (day >= 21)) OR ((month = 'july') AND (day <= 22)) then
   begin
        self.printstr;
        writeln('Your horoscope is Cancer! Cancers are highly intuitive and their psychic abilities manifest in tangible spaces');
   end

   else if ((month = 'july') AND (day >= 23)) OR ((month = 'august') AND (day <= 22)) then
   begin
        self.printstr;
        writeln('You are a Leo! Vivacious, theatrical, and passionate, Leos love to bask in the spotlight and celebrate themselves.');
   end

   else if ((month = 'august') AND (day >= 23)) OR ((month = 'september') AND (day <= 22)) then
   begin
        self.printstr;
        writeln('You are a Virgo! Virgos are logical, practical, and systematic in their approach to life');
   end

   else if ((month = 'september') AND (day >= 23)) OR ((month = 'october') AND (day <= 22)) then
   begin
        self.printstr;
        writeln('You are a Libra! Libra is obsessed with symmetry and strives to create equilibrium in all areas of life.');
   end

   else if ((month = 'october') AND (day >= 23)) OR ((month = 'november') AND (day <= 21)) then
   begin
        self.printstr;
        writeln('You are a Scorpio! Scorpio is a water sign that derives its strength from the psychic, emotional realm.');
   end

   else if ((month = 'november') AND (day >= 22)) OR ((month = 'december') AND (day <= 21)) then
   begin
        self.printstr;
        writeln('You are a Sagittarius! Sagittarius launches its many pursuits like blazing arrows, chasing after geographical, intellectual, and spiritual adventures.');
   end

   else if ((month = 'december') AND (day >= 22)) OR ((month = 'january') AND (day <= 19)) then
   begin
        self.printstr;
        writeln('You are a Capricorn! Capricorns are skilled at navigating both the material and emotional realms.')
   end

   else
   begin
        writeln('That is not a real month');
   end;
end;

begin
   repeat
        //get birth month
        writeln('Please enter your month of birth: ');
        readln(month);   // read from input

        //get day
        writeln('Please enter your day of birth: ');
        readln(day);     // read from input

        //create sign instantance and print output
        m1:= Sign.create(month, day);  // create a sign instance
        m1.printout;    //print out lines
   until (month = 'quit') OR (day = 'quit'); //repeat until quit is entered

   //end
   writeln('Please press enter!'); // let them see the final output
   readln;                         // read whatever was entered and end
end.
