use utf8;
package DoctorWho::Schema::Result::Companion;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DoctorWho::Schema::Result::Companion

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<companion>

=cut

__PACKAGE__->table("companion");

=head1 ACCESSORS

=head2 companion_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 actor_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "companion_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "actor_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</companion_id>

=back

=cut

__PACKAGE__->set_primary_key("companion_id");

=head1 RELATIONS

=head2 actor

Type: belongs_to

Related object: L<DoctorWho::Schema::Result::Actor>

=cut

__PACKAGE__->belongs_to(
  "actor",
  "DoctorWho::Schema::Result::Actor",
  { actor_id => "actor_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 companion_appearances

Type: has_many

Related object: L<DoctorWho::Schema::Result::CompanionAppearance>

=cut

__PACKAGE__->has_many(
  "companion_appearances",
  "DoctorWho::Schema::Result::CompanionAppearance",
  { "foreign.companion_id" => "self.companion_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-11-21 14:58:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:w5E3kUwFoUgI89c9r+44VA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
