#!/bin/bash -f

cat $1 > tmpA.txt
awk '
{
    if ($0 ~ /\t \t/) 
	{
        sub(/\t \t/,"\t") $0;
        print $0;

    } else 
    {
	    print $0;
    }

}
' tmpA.txt >> tmpB.txt
cat tmpC.txt > tmpA.txt
awk '
{
    if ($0 ~ / \t/)     
    {
        sub(/ \t/,"\t") $0;
        print $0;

    } else 
    {
        print $0;
    }
}
' tmpB.txt >> tmpA.txt
cat tmpC.txt > tmpB.txt
awk '
BEGIN {saved="";}
{
    if ($0 ~ /\t$/) 
    {
        saved=$0;
    } else
    {
        if (saved !~ /""/ ) {
            printf "%s %s\n",saved, $0;
            saved = "";
        } else {
            print "C" $0;        
        }
    
    }
}
' tmpA.txt >> tmpB.txt
cat tmpC.txt > tmpA.txt
awk '
{
    if ($0 ~ / – /) 
    {
        sub(/ – /,"\t") $0;
        print  $0;

    } else 
    {
        print $0;
    }
}
' tmpB.txt > processedHours.txt 
cat tmpC.txt > tmpB.txt


