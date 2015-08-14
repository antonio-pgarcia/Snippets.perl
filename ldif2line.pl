#!/usr/bin/perl

#--------------------------------------------------
# A  perl example for multi-line record parsing
# Antonio Prestes García
#--------------------------------------------------

# TODO: define start and stop tokens ----------
my $start = 'begin';
my $stop = 'end';


while (<DATA>) {
        if ($_ =~ /^$start:\s*(.*)/) {
                @container = ();
                push(@container,"\"" . $1 . "\"; ");
        } elsif ($_ =~ /^$stop:\s*(.*)/) {
                push(@container,"\"" . $1 . "\"; ");
                print @container,"\n";
        } elsif ($_ =~ /^\w+:\s*(.*)/) {
                push(@container,"\"" . $1 . "\"; ");
        }
}


__DATA__
version v1
begin: record 1 value
head1: record 1 field1, field1
head2: record 1 value1
head3: record 1 value2
head4: record 1 value5
end: record 1 end value

begin: record 2 value
head1: record 2 field1, field1
head2: record 2 value1
head3: record 2 talue2
head4: record 2 value5
end: record 2 end value
