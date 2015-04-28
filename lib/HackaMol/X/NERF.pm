package HackaMol::X::NERF;
use strict;
use warnings;
use Math::Vector::Real;
use Math::Trig;

# extend system by 1 atom.
# ABC to ABCD
sub ext {
  return V(0,0,0);
}

sub ext_a {
  my ($a, $R,$optvec) = (shift,shift,shift);
  $optvec = V(1,0,0) unless defined($optvec);
  return ($a + $R*$optvec); 
}

sub ext_ab {
  my ($a,$b,$R,$ang) = @_;
  $ang  = deg2rad(180-$ang);
  my ($ba, $j, $k) = ($b-$a)->rotation_base_3d;
  my $c = $b+$ba*$R;
  #print abs($c-$b) . "\n";
  $c = $j->rotate_3d($ang, $c-$b) + $b;
  #print abs($c-$b) . "\n";
  return ($c);
}

sub ext_abc {
  my ($a,$b,$c,$R,$ang,$tors) = @_;
  $ang  = deg2rad(180-$ang);
  $tors = deg2rad($tors);
  my $cang = cos($ang);
  my $sang = sin($ang);
  my $ctor = cos($tors);
  my $stor = sin($tors);

  my $bc = ($c-$b)->versor;
  my $n = (($b-$a) x $bc)->versor;

  my $D = $R*($bc*$cang + ($n x $bc)*$sang*$ctor + $n*$sang*$stor) + $c;
  return $D;
}


1;