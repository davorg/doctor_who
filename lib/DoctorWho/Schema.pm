use utf8;
package DoctorWho::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-11-21 14:55:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TKb/vXa2JjfxP6Mgy+Qf9g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);

sub get_schema {
  my $db_file = $ENV{DRWHO_DB_FILE} // 'db/doctor-who.db';

  -e $db_file or die "$db_file does not exist\n";
  -f $db_file or die "$db_file is not a file\n";
  -r $db_file or die "Cannot read $db_file\n";
  -w $db_file or die "Cannot write $db_file\n";

  my $schema = __PACKAGE__->connect("dbi:SQLite:$db_file") or die;

  return $schema;
}

1;
