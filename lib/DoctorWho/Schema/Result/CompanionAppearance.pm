use utf8;
package DoctorWho::Schema::Result::CompanionAppearance;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DoctorWho::Schema::Result::CompanionAppearance

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

=head1 TABLE: C<companion_appearance>

=cut

__PACKAGE__->table("companion_appearance");

=head1 ACCESSORS

=head2 appearance_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 story_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 companion_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "appearance_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "story_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "companion_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</appearance_id>

=back

=cut

__PACKAGE__->set_primary_key("appearance_id");

=head1 RELATIONS

=head2 companion

Type: belongs_to

Related object: L<DoctorWho::Schema::Result::Companion>

=cut

__PACKAGE__->belongs_to(
  "companion",
  "DoctorWho::Schema::Result::Companion",
  { companion_id => "companion_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 story

Type: belongs_to

Related object: L<DoctorWho::Schema::Result::Story>

=cut

__PACKAGE__->belongs_to(
  "story",
  "DoctorWho::Schema::Result::Story",
  { story_id => "story_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-11-21 14:58:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k/cekRFTPAankV17Oou8YQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
